class Api::V1::ForcastController < ApplicationController
  def index
    if params[:location].present?
      coordinates = GeoCodeFacade.coordinates(params[:location])
      if coordinates.nil?
        render json: { error: "No Location Found" },  status: 404
      else
        if !params[:units].present?
          forcast = ForcastFacade.forcast(coordinates, 'imperial')
          render json: ForcastSerializer.new(forcast).serializable_hash.to_json
        else
          forcast = ForcastFacade.forcast(coordinates, params[:units])
          render json: ForcastSerializer.new(forcast).serializable_hash.to_json
        end
      end
    else
      render json: { error: "Invalid Search" },  status: 400
    end
  end
end