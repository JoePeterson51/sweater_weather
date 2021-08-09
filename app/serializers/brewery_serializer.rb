class BrewerySerializer
  include JSONAPI::Serializer

  set_type :breweries
  set_id :id
  attributes :summary, :temperature, :id, :name, :brewery_type
end