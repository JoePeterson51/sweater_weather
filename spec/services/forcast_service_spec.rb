require 'rails_helper'

RSpec.describe 'forcast service' do
  it 'returns a forcast for the given coordinates' do
    VCR.use_cassette "Forcast" do
      forcast = ForcastService.get_forcast({:lat=>39.738453, :lng=>-104.984853})

      expect(forcast).to have_key(:current)
      expect(Time.at(forcast[:current][:dt]).to_s).to eq("2021-08-07 00:08:38 -0600")
      expect(Time.at(forcast[:current][:sunrise]).to_s).to eq("2021-08-07 06:04:49 -0600")
      expect(Time.at(forcast[:current][:sunset]).to_s).to eq("2021-08-07 20:06:33 -0600")
      expect(forcast[:current][:temp]).to eq(68.83)
      expect(forcast[:current][:feels_like]).to eq(67.91)
      expect(forcast[:current][:humidity]).to eq(53)
      expect(forcast[:current][:uvi]).to eq(0)
      expect(forcast[:current][:visibility]).to eq(10000)
      expect(forcast[:current][:weather][0][:description]).to eq("scattered clouds")
      expect(forcast[:current][:weather][0][:icon]).to eq("03n")

      expect(forcast).to have_key(:daily)
      expect(Time.at(forcast[:daily][0][:dt]).strftime("%d:%m:%Y")).to eq("07:08:2021")
      expect(Time.at(forcast[:daily][0][:sunrise]).to_s).to eq("2021-08-07 06:04:49 -0600")
      expect(Time.at(forcast[:daily][0][:sunset]).to_s).to eq("2021-08-07 20:06:33 -0600")
      expect(forcast[:daily][0][:temp][:max]).to eq(89.1)
      expect(forcast[:daily][0][:temp][:min]).to eq(68.2)
      expect(forcast[:daily][0][:weather][0][:description]).to eq("scattered clouds")
      expect(forcast[:daily][0][:weather][0][:icon]).to eq("03d")

      expect(forcast).to have_key(:hourly)
      expect(Time.at(forcast[:hourly][0][:dt]).strftime("%H:%M:%S")).to eq("00:00:00")
      expect(forcast[:hourly][0][:temp]).to eq(68.83)
      expect(forcast[:hourly][0][:weather][0][:description]).to eq("scattered clouds")
      expect(forcast[:hourly][0][:weather][0][:icon]).to eq("03n")
    end
  end
end