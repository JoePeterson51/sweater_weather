class Api::V1::ForcastController < ApplicationController
  def index
    if params[:location].present?
      coordinates = GeoCodeFacade.coordinates(params[:location])
      if coordinates.nil?
        render json: { error: "No Location Found" },  status: 404
      else
        forcast = ForcastFacade.forcast(coordinates)
        render json: ForcastSerializer.new(forcast).serializable_hash.to_json
      end
    else
      render json: { error: "Invalid Search" },  status: 400
    end
  end
end