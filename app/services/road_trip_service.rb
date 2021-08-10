class RoadTripService
  def self.get_roadtrip(from, to)
    url = 'http://www.mapquestapi.com/directions/v2/route'
    response = Faraday.get(url, {key: ENV['GEO_CODE_API_KEY'], from: from, to: to})
    JSON.parse(response.body, symbolize_names: true)
  end
end