require 'rails_helper'

RSpec.describe 'brewery forcast poro' do
  it 'creates a brewery forcast object' do
    VCR.use_cassette "Brewery Forcast" do
      forcast_data = ForcastService.get_forcast({:lat=>39.738453, :lng=>-104.984853})[:current]
      brewery_data = BreweryService.get_breweries('39.738453,-104.984853', 1)
      brewery_forcast = BreweryForcast.new(forcast_data, brewery_data)

      expect(brewery_forcast.forcast[:summary]).to eq("clear sky")
      expect(brewery_forcast.forcast[:temperature]).to eq(90.75)
      expect(brewery_forcast.breweries[0].id).to eq(8245)
      expect(brewery_forcast.breweries[0].name).to eq("Aero Craft Brewing")
      expect(brewery_forcast.breweries[0].brewery_type).to eq("planning")
    end
  end
end