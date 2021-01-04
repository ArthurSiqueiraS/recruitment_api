class TechnologiesController < ApplicationController
  def index
    render json: Technology.all, status: :ok
  end
end
