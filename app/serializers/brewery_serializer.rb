class BrewerySerializer
  include JSONAPI::Serializer

  set_type :breweries
  set_id nil
  attributes :id, :name, :brewery_type
end