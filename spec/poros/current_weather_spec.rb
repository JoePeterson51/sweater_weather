require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'creates a current weather object' do
    VCR.use_cassette "Forcast" do
      forcast = ForcastFacade.forcast({:lat=>39.738453, :lng=>-104.984853})
      current_weather = forcast.current_weather

      expect(current_weather.class).to eq(CurrentWeather)
      expect(current_weather.conditions).to eq("scattered clouds")
      expect(current_weather.datetime).to eq("2021-08-07 00:08:38 -0600")
      expect(current_weather.feels_like).to eq(67.91)
      expect(current_weather.humidity).to eq(53)
      expect(current_weather.icon).to eq("03n")
      expect(current_weather.sunrise).to eq("2021-08-07 06:04:49 -0600")
      expect(current_weather.sunset).to eq("2021-08-07 20:06:33 -0600")
      expect(current_weather.temperature).to eq(68.83)
      expect(current_weather.uvi).to eq(0)
      expect(current_weather.visibility).to eq(10000)
    end
  end
end