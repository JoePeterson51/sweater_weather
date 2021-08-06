class Api::V1::ForcastController < ApplicationController
  def index
    coordinates = GeoCodeFacade.coordinates(params[:location])
    city_forcast = ForcastFacade.forcast(coordinates)
  end
end