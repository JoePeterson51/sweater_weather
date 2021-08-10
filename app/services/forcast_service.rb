class ForcastService
  def self.get_forcast(location, units = 'imperial')
    url = "https://api.openweathermap.org/data/2.5/onecall"
    response = Faraday.get(url,
      {
        lat: location[:lat],
        lon: location[:lng],
        units: units,
        exclude: 'minutley,alerts',
        appid: ENV['FORCAST_API_KEY']
      })
    JSON.parse(response.body, symbolize_names: true)
  end
end