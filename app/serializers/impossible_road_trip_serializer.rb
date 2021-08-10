class ImpossibleRoadTripSerializer
  def self.impossible_road_trip(start, finish)
    {
      data: {
        id: nil,
        type: 'roadtrip',
        attributes: {
          start_city: start,
          end_city: finish,
          travel_time: 'Impossible',
          weather_at_eta: {
          }
        }
      }
    }
  end
end