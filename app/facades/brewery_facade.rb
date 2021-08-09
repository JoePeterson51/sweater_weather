class BreweryFacade
  def self.breweries(coordinates, quantity, geo_code)
    brewery_data = BreweryService.get_breweries(coordinates, quantity)
    forcast_data = ForcastService.get_forcast(geo_code)[:current]
    forcast = BreweryForcast.new(forcast_data)
    breweries = brewery_data.each do |brewery|
      Brewery.new(brewery)
    end
    breweries.unshift(forcast)
  end
end