require 'rails_helper'

RSpec.describe 'road trip facade' do
  it 'makes a call to the api and returns a road trip object' do
    VCR.use_cassette "Road Trip" do
      road_trip = RoadTripFacade.roadtrip('New York,NY', 'Los Angeles,CA')

      expect(road_trip.start_city).to eq('New York,NY')
      expect(road_trip.end_city).to eq('Los Angeles,CA')
      expect(road_trip.travel_time).to eq("40:34:31")
    end
  end

  describe 'sad path' do
    it 'returns nil if the trip is impossible' do
      VCR.use_cassette "Impossible Road Trip" do
        road_trip = RoadTripFacade.roadtrip('New York,NY', 'London,UK')

        expect(road_trip).to eq(nil)
      end
    end
  end
end