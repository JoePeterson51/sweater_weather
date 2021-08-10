class RoadTripForcast
  attr_reader :temperature, :conditions
  def initialize(data, hours)
    @temperature = data[:hourly][hours][:temp]
    @conditions = data[:hourly][hours][:weather][0][:description]
  end
end