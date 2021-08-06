class ForcastFacade
  def self.forcast(location)
    data = ForcastService.get_forcast(location)
  end
end