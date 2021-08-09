require 'rails_helper'

RSpec.describe 'forcast service' do
  it 'returns a forcast for the given coordinates' do
    VCR.use_cassette "Forcast" do
      forcast = ForcastService.get_forcast({:lat=>39.738453, :lng=>-104.984853})

      expect(forcast).to be_a(Hash)
      expect(forcast[:timezone]).to eq("America/Denver")
    end
  end
end