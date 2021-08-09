require 'rails_helper'

RSpec.describe 'Unsplash API request' do
  it 'returns an image based on a search param' do
    get '/api/v1/backgrounds?location=denver,co'
  end
end