class BreweryService
  def self.get_breweries(coordinates, quantity)
    url = 'https://api.openbrewerydb.org/breweries'
    response = Faraday.get(url, {by_dist: coordinates, per_page: quantity})
    JSON.parse(response.body, symbolize_names: true)
  end
end