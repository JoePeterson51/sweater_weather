class BackgroundFacade
  def self.get_background(search)
    background = BackgroundService.search_backgrounds(search)
  end
end