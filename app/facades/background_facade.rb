class BackgroundFacade
  def self.background(search)
    background = BackgroundService.get_background(search)
    Background.new(background, search)
  end
end