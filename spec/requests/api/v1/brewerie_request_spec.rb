require 'rails_helper'

RSpec.describe 'brewerie request' do
  it 'returns the number of breweries specified in the city specified' do
    VCR.use_cassette "Brewery_JSON" do
      get '/api/v1/breweries?location=denver,co&quantity=5'
      brewery_forcast = JSON.parse(response.body, symbolize_names: true)

      expect(brewery_forcast[:data][:id]).to eq(nil)
      expect(brewery_forcast[:data][:type]).to eq("breweries")
      expect(brewery_forcast[:data][:attributes][:forcast][:summary]).to eq("clear sky")
      expect(brewery_forcast[:data][:attributes][:forcast][:temperature]).to eq(89.91)
      expect(brewery_forcast[:data][:attributes][:breweries].count).to eq(5)
      expect(brewery_forcast[:data][:attributes][:breweries][0][:id]).to eq(8962)
      expect(brewery_forcast[:data][:attributes][:breweries][0][:name]).to eq("Black Beak Brewing")
      expect(brewery_forcast[:data][:attributes][:breweries][0][:brewery_type]).to eq("planning")
    end
  end
end