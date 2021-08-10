class RoadTrip
  attr_reader :start_city, :end_city, :travel_time
  def initialize(data)
    @start_city = data[:route][:locations][0][:adminArea5] + ',' + data[:route][:locations][0][:adminArea3]
    @end_city = data[:route][:locations][1][:adminArea5] + ',' + data[:route][:locations][1][:adminArea3]
    @travel_time = data[:route][:formattedTime]
  end
end