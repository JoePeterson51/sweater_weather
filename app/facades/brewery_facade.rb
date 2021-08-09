class BreweryFacade
  def self.breweries(coordinates, quantity, geo_code)
    brewery_data = BreweryService.get_breweries(coordinates, quantity)
    forcast_data = ForcastService.get_forcast(geo_code)[:current]
    breweries_forcast = BreweryForcast.new(forcast_data, brewery_data)
  end
end