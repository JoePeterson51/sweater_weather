class ForcastFacade
  def self.forcast(location)
    data = ForcastService.get_forcast(location)
    forcast = Forcast.new(data)
  end

  def self.brewery_forcast(location)
    data = ForcastService.get_forcast(location)[:current]
    forcast = BreweryForcast.new(data)
  end
end