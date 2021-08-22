require 'rails_helper'

RSpec.describe 'session request' do
  it 'can create a new session and return proper object to FE' do
    user_1 = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "xxxxxx")
    headers = {
      'Content-Type': "application/json",
      'Accept': "application/json"
    }
    body = {
      "email": "whatever@example.com",
      "password": "password"
    }
    post '/api/v1/sessions', headers: headers, params: body.to_json

    user = JSON.parse(response.body, symbolize_names: true)
require 'pry'; binding.pry
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user[:data][:type]).to eq('users')
    expect(user[:data][:id].to_i).to eq(user_1.id)
    expect(user[:data][:attributes][:email]).to eq(user_1.email)
    expect(user[:data][:attributes][:api_key]).to eq(user_1.api_key)
  end

  describe 'sad paths' do
    it 'returns error is no password/email present' do
      user_1 = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "xxxxxx")
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }
      body = {
        "email": "",
        "password": "password"
      }
      post '/api/v1/sessions', headers: headers, params: body.to_json

      expect(response.status).to eq(403)
      expect(response.body).to eq("{\"error\":\"Incorrect Email/Password\"}")

      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }
      body = {
        "email": "whatever@example.com",
        "password": ""
      }
      post '/api/v1/sessions', headers: headers, params: body.to_json

      expect(response.status).to eq(403)
      expect(response.body).to eq("{\"error\":\"Incorrect Email/Password\"}")
    end

    it 'returns error if password/username is incorrect' do
      user_1 = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "xxxxxx")
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }
      body = {
        "email": "wrong@email.com",
        "password": "password"
      }
      post '/api/v1/sessions', headers: headers, params: body.to_json

      expect(response.status).to eq(403)
      expect(response.body).to eq("{\"error\":\"Incorrect Email/Password\"}")

      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }
      body = {
        "email": "whatever@example.com",
        "password": "oopswrongpassword"
      }
      post '/api/v1/sessions', headers: headers, params: body.to_json

      expect(response.status).to eq(403)
      expect(response.body).to eq("{\"error\":\"Incorrect Email/Password\"}")
    end
  end
end