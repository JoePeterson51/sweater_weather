class ForcastFacade
  def self.forcast(location, units = 'imperial')
    data = ForcastService.get_forcast(location, units)
    forcast = Forcast.new(data)
  end

  def self.road_trip_forcast(coordinates, hours)
    data = ForcastService.get_forcast(coordinates)
    forcast = RoadTripForcast.new(data, hours)
  end
end