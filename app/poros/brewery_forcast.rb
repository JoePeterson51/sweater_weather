class BreweryForcast
  attr_reader :id, :forcast, :breweries
  def initialize(forcast, breweries)
    @id = nil
    @forcast = {summary: forcast[:weather][0][:description], temperature: forcast[:temp]}
    @breweries = breweries
  end

  def breweries
    @breweries.map do |brewery|
      Brewery.new(brewery)
    end
  end
end