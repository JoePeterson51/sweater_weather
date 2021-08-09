class Api::V1::BreweriesController < ApplicationController
  def index
    geo_code = GeoCodeFacade.coordinates(params[:location])
    coordinates = geo_code[:lat].to_s + "," + geo_code[:lng].to_s
    breweries = BreweryFacade.breweries(coordinates, params[:quantity], geo_code)
    render json: BrewerySerializer.new(breweries).serializable_hash.to_json
  end
end