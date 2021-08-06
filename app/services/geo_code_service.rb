class GeoCodeService
  def self.get_coordinates(location)
    url = "http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['GEO_CODE_API_KEY']}"
    response = Faraday.get(url, {location: location})
    json = JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end
end