class ForcastSerializer
  include JSONAPI::Serializer

  set_type :forcast
  set_id :id
  attributes :current_weather, :daily_weather, :hourly_weather
end
