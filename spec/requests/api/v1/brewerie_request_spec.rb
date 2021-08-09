require 'rails_helper'

RSpec.describe 'brewerie request' do
  it 'returns the number of breweries specified in the city specified' do
    get '/api/v1/breweries?location=denver,co&quantity=5'

  end
end