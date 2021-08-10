require 'rails_helper'

RSpec.describe 'road trip request' do
  it 'can take a request for a roadtrip and return a json object' do
    VCR.use_cassette 'Road Trip' do
      user_1 = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }
      body = {
        'origin': 'New York,NY',
        'destination': 'Los Angeles,CA',
        'api_key': 'jgn983hy48thw9begh98h4539h4'
      }

      post '/api/v1/road_trip', headers: headers, params: body.to_json

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(road_trip[:data][:id]).to eq(nil)
      expect(road_trip[:data][:type]).to eq("roadtrip")
      expect(road_trip[:data][:attributes][:start_city]).to eq("New York,NY")
      expect(road_trip[:data][:attributes][:end_city]).to eq("Los Angeles,CA")
      expect(road_trip[:data][:attributes][:travel_time]).to eq("40:34:31")
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to eq(74.7)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to eq("clear sky")
    end
  end

  it 'returns impossible route json object if trip is impossible' do
    VCR.use_cassette 'Impossible Road Trip' do
      user_1 = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }
      body = {
        'origin': 'New York,NY',
        'destination': 'London,UK',
        'api_key': 'jgn983hy48thw9begh98h4539h4'
      }

      post '/api/v1/road_trip', headers: headers, params: body.to_json

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(road_trip[:data][:id]).to eq(nil)
      expect(road_trip[:data][:type]).to eq("roadtrip")
      expect(road_trip[:data][:attributes][:start_city]).to eq("New York,NY")
      expect(road_trip[:data][:attributes][:end_city]).to eq("London,UK")
      expect(road_trip[:data][:attributes][:travel_time]).to eq("Impossible")
      expect(road_trip[:data][:attributes][:weather_at_eta]).to_not have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to_not have_key(:conditions)
    end
  end

  describe 'sad path' do
    it 'returns error if no api_key is provided' do
      user_1 = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }
      body = {
        'origin': 'New York,NY',
        'destination': 'London,UK',
      }

      post '/api/v1/road_trip', headers: headers, params: body.to_json

      expect(response.status).to eq(401)
      expect(response.body).to eq("{\"error\":\"Unauthorized\"}")
    end
  end
end