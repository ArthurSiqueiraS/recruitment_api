class QualificationsController < ApplicationController
  before_action :validate_params

  private

  def validate_params
    errors = []

    if params[:technologies].present?
      unless params[:technologies].is_a? Array
        errors.push("Technologies should be passed as an array")
      end
    end

    if params[:experienceRange].present?
      unless params[:experienceRange].is_a? Array
        errors.push("Experience range should be passed as an array")
      end
    end

    unless errors.empty?
      return render json: { errors: errors }, status: :bad_request
    end
  end

  def query(collection, params)
    query = {}

    if params[:locations].present?
      locations = params[:locations] == 'remote' ? nil : params[:locations]
      query[:location] = locations
    end

    if params[:technologies].present?
      collection_name = collection.name.downcase.pluralize
      association_name = (collection_name + '_technologies').to_sym

      collection = collection
        .joins(association_name)
        .group("#{collection_name}.id")
        .having('count(*) = ?', params[:technologies].count)

      query[association_name] = { technology_id: params[:technologies] }
    end

    if params[:experienceRange].present?
      min, max = params[:experienceRange].map { |n| n.to_i }
      range = min..max
      query[:exp_min] = min..max
      query[:exp_max] = [min..max, nil]
    end

    collection.where(query).order(exp_min: :desc)
  end
end