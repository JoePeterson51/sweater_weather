require 'rails_helper'

RSpec.describe RoadTrip do
  it 'creates a road trip object' do
    VCR.use_cassette "Road Trip" do
      data = RoadTripService.get_roadtrip('New York,NY', 'Los Angeles,CA')
      road_trip = RoadTrip.new(data)

      expect(road_trip.start_city).to eq('New York,NY')
      expect(road_trip.end_city).to eq('Los Angeles,CA')
      expect(road_trip.travel_time).to eq("40:34:31")
    end
  end
end