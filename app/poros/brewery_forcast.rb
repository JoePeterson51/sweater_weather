class BreweryForcast
  attr_reader :summary, :temperature
  def initialize(data)
    @id = nil
    @summary = data[:weather][0][:description]
    @temperature = data[:temp]
  end
end