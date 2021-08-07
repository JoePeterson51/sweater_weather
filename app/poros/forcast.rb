class Forcast
  attr_reader :id, :current_weather, :hourly_weather, :daily_weather
  def initialize(data)
    @id = nil
    @current_weather = CurrentWeather.new(data[:current])
    @hourly_weather = data[:hourly].first(8)
    @daily_weather = data[:daily].first(5)
  end

  def hourly_weather
    @hourly_weather.map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def daily_weather
    @daily_weather.map do |day|
      DailyWeather.new(day)
    end
  end
end