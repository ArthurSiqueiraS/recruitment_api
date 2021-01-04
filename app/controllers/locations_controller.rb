class LocationsController < ApplicationController
  def index
    render json: Location.all, status: :ok
  end
end
