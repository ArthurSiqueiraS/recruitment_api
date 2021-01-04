class TechnologiesController < ApplicationController
  def index
    render json: Technology.order('lower(name) ASC').all, status: :ok
  end
end
