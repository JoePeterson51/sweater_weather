class GeoCodeFacade
  def self.coordinates(location)
    coordinates = GeoCodeService.get_coordinates(location)
  end
end