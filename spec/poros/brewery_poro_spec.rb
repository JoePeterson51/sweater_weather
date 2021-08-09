require 'rails_helper'

RSpec.describe 'brewery poro' do
  it 'creates a brewery object' do
    VCR.use_cassette "Brewery" do
      brewery = BreweryService.get_breweries('39.738453,-104.984853', 1)
      brewery = Brewery.new(brewery[0])

      expect(brewery.id).to eq(8245)
      expect(brewery.name).to eq("Aero Craft Brewing")
      expect(brewery.brewery_type).to eq("planning")
    end
  end
end