class QualificationsController < ApplicationController
  private

  def query(collection, params)
    query = {}

    if params[:locations].present?
      query[:location] = params[:locations]
    end

    if params[:technologies].present?
      collection = collection
        .joins(:candidates_technologies)
        .group('candidates.id')
        .having('count(*) = ?', params[:technologies].count)

      query[:candidates_technologies] = { technology_id: params[:technologies] }
    end

    if params[:experienceRange].present?
      min, max = params[:experienceRange].map { |n| n.to_i }
      range = min..max
      query[:exp_min] = min..max
      query[:exp_max] = [min..max, nil]
    end

    collection.where(query).order(exp_min: :desc).page(params[:page]).per(5)
  end
end