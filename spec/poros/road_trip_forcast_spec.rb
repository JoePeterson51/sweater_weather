require 'rails_helper'

RSpec.describe RoadTripForcast do
  it 'creates a road trip forcast object' do
    VCR.use_cassette "Forcast" do
      data = ForcastService.get_forcast({:lat=>39.738453, :lng=>-104.984853})
      road_trip_forcast = RoadTripForcast.new(data, 2)

      expect(road_trip_forcast.temperature).to eq(69.39)
      expect(road_trip_forcast.conditions).to eq("scattered clouds")
      expect(road_trip_forcast.temperature).to eq(data[:hourly][2][:temp])
      expect(road_trip_forcast.conditions).to eq(data[:hourly][2][:weather][0][:description])
    end
  end
end