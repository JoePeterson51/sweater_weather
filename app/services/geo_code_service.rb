class GeoCodeService
  def self.get_coordinates(location)
    url = "http://www.mapquestapi.com/geocoding/v1/address"
    response = Faraday.get(url, {key: ENV['GEO_CODE_API_KEY'], location: location})
    json = JSON.parse(response.body, symbolize_names: true)
    if json[:results][0][:locations].empty?
      return nil
    else
      return json[:results][0][:locations][0][:latLng]
    end
  end
end