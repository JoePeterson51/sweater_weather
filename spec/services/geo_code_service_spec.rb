require 'rails_helper'

RSpec.describe 'geo code service' do
  it 'returns the coordinates for a given city and state' do
    VCR.use_cassette "Coordinates" do
      coordinates = GeoCodeService.get_coordinates('denver,co')

      expect(coordinates).to eq({:lat=>39.738453, :lng=>-104.984853})
    end
  end
end