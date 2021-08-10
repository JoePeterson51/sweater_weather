class RoadTripSerializer
  def self.road_trip_and_forcast(road_trip, forcast)
    {
      data: {
        id: nil,
        type: 'roadtrip',
        attributes: {
          start_city: road_trip.start_city,
          end_city: road_trip.end_city,
          travel_time: road_trip.travel_time,
          weather_at_eta: {
            temperature: forcast.temperature,
            conditions: forcast.conditions
          }
        }
      }
    }
  end
end