class BackgroundFacade
  def self.background(search)
    background = BackgroundService.get_background(search)
    if background[:results].empty?
      return nil
    else
      Background.new(background, search)
    end
  end
end