class Api::V1::ForcastController < ApplicationController
  def index
    coordinates = GeoCodeFacade.coordinates(params[:location])
    forcast = ForcastFacade.forcast(coordinates)
    render json: ForcastSerializer.new(forcast).serializable_hash.to_json
  end
end