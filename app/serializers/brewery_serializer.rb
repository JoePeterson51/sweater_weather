class BrewerySerializer
  include JSONAPI::Serializer

  set_type :breweries
  set_id :id
  attributes :forcast, :breweries
end