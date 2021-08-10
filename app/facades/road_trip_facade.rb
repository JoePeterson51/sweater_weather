class RoadTripFacade
  def self.roadtrip(from, to)
    data = RoadTripService.get_roadtrip(from, to)
    if data[:info][:messages].empty?
      roadtrip = RoadTrip.new(data)
    else
      return nil
    end
  end
end