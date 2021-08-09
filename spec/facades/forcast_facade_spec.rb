require 'rails_helper'

RSpec.describe 'forcast facade' do
  it 'can return a forcast object' do
    VCR.use_cassette "Forcast" do
      forcast = ForcastFacade.forcast({:lat=>39.738453, :lng=>-104.984853})

      expect(forcast.current_weather).to be_a(CurrentWeather)
      expect(forcast.daily_weather[0]).to be_a(DailyWeather)
      expect(forcast.hourly_weather[0]).to be_a(HourlyWeather)
    end
  end
end