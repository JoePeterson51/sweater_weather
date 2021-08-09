class ForcastFacade
  def self.forcast(location)
    data = ForcastService.get_forcast(location)
    forcast = Forcast.new(data)
  end
end