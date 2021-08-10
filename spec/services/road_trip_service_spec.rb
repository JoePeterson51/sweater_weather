require 'rails_helper'

RSpec.describe 'road trip service' do
  it 'makes a call to the map quest api and returns a json object' do
    VCR.use_cassette 'Road Trip' do
      road_trip = RoadTripService.get_roadtrip('New York,NY', 'Los Angeles,CA')

      expect(road_trip[:route][:locations][0][:adminArea5] + ',' + road_trip[:route][:locations][0][:adminArea3]).to eq('New York,NY')
      expect(road_trip[:route][:locations][1][:adminArea5] + ',' + road_trip[:route][:locations][1][:adminArea3]).to eq('Los Angeles,CA')
      expect(road_trip[:route][:formattedTime]).to eq('40:34:31')
    end
  end
end