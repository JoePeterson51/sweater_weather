require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'creates a hourly weather object' do
    VCR.use_cassette "Forcast" do
      forcast = ForcastFacade.forcast({:lat=>39.738453, :lng=>-104.984853})
      hourly_weather = forcast.hourly_weather

      expect(hourly_weather).to be_an(Array)
      expect(hourly_weather.count).to eq(8)
      expect(hourly_weather[0].conditions).to eq("scattered clouds")
      expect(hourly_weather[0].icon).to eq("03n")
      expect(hourly_weather[0].temperature).to eq(68.83)
      expect(hourly_weather[0].time).to eq("00:00:00")
    end
  end
end