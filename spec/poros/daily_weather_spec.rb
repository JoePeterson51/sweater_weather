require 'rails_helper'

RSpec.describe DailyWeather do
  it 'creates a daily weather object' do
    VCR.use_cassette "Forcast" do
      forcast = ForcastFacade.forcast({:lat=>39.738453, :lng=>-104.984853})
      daily_weather = forcast.daily_weather

      expect(daily_weather).to be_a(Array)
      expect(daily_weather.count).to eq(5)
      expect(daily_weather[0].conditions).to eq("scattered clouds")
      expect(daily_weather[0].date).to eq("2021-08-07 13:00:00 -0600")
      expect(daily_weather[0].icon).to eq("03d")
      expect(daily_weather[0].max_temp).to eq(89.1)
      expect(daily_weather[0].min_temp).to eq(68.2)
      expect(daily_weather[0].sunrise).to eq("2021-08-07 06:04:49 -0600")
      expect(daily_weather[0].sunset).to eq("2021-08-07 20:06:33 -0600")
    end
  end
end