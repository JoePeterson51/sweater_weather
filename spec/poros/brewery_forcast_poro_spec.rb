require 'rails_helper'

RSpec.describe 'brewery forcast poro' do
  it 'creates a brewery forcast object' do
    VCR.use_cassette "Brewery Forcast" do
      forcast_data = ForcastService.get_forcast({:lat=>39.738453, :lng=>-104.984853})[:current]
      forcast = BreweryForcast.new(forcast_data)

      expect(forcast.summary).to eq("clear sky")
      expect(forcast.temperature).to eq(87.93)
    end
  end
end