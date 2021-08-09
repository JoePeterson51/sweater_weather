class Api::V1::BreweriesController < ApplicationController
  def index
    geo_code = GeoCodeFacade.coordinates(params[:location])
    coordinates = geo_code[:lat].to_s + "," + geo_code[:lng].to_s
    forcast = ForcastFacade.brewery_forcast(geo_code)
    breweries = BreweryFacade.breweries(coordinates, params[:quantity], geo_code)
    a = render json: BrewerySerializer.new(breweries).serializable_hash.to_json
    require 'pry'; binding.pry
  end
end