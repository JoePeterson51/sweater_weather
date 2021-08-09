require 'rails_helper'

RSpec.describe 'brewery facade' do
  it 'can get breweries and the forcast and make and object' do
    VCR.use_cassette "Brewery Facade" do
      brewery_forcast = BreweryFacade.breweries('39.738453,-104.984853', 1, {:lat=>39.738453, :lng=>-104.984853})

      expect(brewery_forcast.class).to eq(BreweryForcast)
      expect(brewery_forcast.id).to eq(nil)
      expect(brewery_forcast.forcast[:summary]).to eq("clear sky")
      expect(brewery_forcast.forcast[:temperature]).to eq(90.97)
      expect(brewery_forcast.breweries[0].id).to eq(8245)
      expect(brewery_forcast.breweries[0].name).to eq("Aero Craft Brewing")
      expect(brewery_forcast.breweries[0].brewery_type).to eq("planning")
    end
  end
end