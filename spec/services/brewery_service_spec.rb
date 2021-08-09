require 'rails_helper'

RSpec.describe 'brewery service' do
  it 'returns breweries' do
    breweries = BreweryService.get_breweries('39.738453,-104.984853', 5)

    expect(breweries.count).to eq(5)
    breweries.each do |brewery|
      expect(brewery).to have_key(:id)
      expect(brewery).to have_key(:name)
      expect(brewery).to have_key(:brewery_type)
    end
    expect(breweries[0][:id]).to eq(8962)
    expect(breweries[0][:name]).to eq("Black Beak Brewing")
    expect(breweries[0][:brewery_type]).to eq("planning")
  end
end