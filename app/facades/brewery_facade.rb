class BreweryFacade
  def self.breweries(coordinates, quantity, geo_code)
    brewery_data = BreweryService.get_breweries(coordinates, quantity)
    breweries = brewery_data.each do |brewery|
      Brewery.new(brewery)
    end
  end
end