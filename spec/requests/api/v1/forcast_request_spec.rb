require 'rails_helper'

RSpec.describe "Forcast API" do
  it 'returns a forcast for a location' do
    get '/api/v1/forcast?location=denver,co'

    expect(response.status).to eq(200)
  end
end