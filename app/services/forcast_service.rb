class ForcastService
  def self.get_forcast(location)
    response = Faraday.get("")
    JSON.parse(response.body, symbolize_names: true)
  end
end