require 'rails_helper'

RSpec.describe 'user POST request' do
  it 'can create a user in the database' do
    headers = {
      'Content-Type': "application/json",
      'Accept': "application/json"
    }

    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', headers: headers, params: body.to_json

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(user[:data][:type]).to eq("users")
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
  end

  describe 'sad paths' do
    it 'returns error if passwords dont match' do
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }

      body = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "words"
      }
      post '/api/v1/users', headers: headers, params: body.to_json

      expect(response.status).to eq(401)
      expect(response.body).to eq("{\"error\":\"Password must match password confirmation\"}")
    end

    it 'returns error if missing information' do
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }

      body = {
        "email": "whatever@example.com",
        "password": "",
        "password_confirmation": ""
      }
      post '/api/v1/users', headers: headers, params: body.to_json

      expect(response.status).to eq(422)
      expect(response.body).to eq("{\"error\":\"Unprocessable Entity\"}")
    end

    it 'returns error if email already exists' do
      User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "xxxxxx")
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }

      body = {
        "email": "whatever@example.com",
        "password": "",
        "password_confirmation": ""
      }
      post '/api/v1/users', headers: headers, params: body.to_json

      expect(response.status).to eq(409)
      expect(response.body).to eq("{\"error\":\"Email already exists\"}")
    end
  end
end