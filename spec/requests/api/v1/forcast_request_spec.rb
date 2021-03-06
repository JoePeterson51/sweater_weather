require 'rails_helper'

RSpec.describe "Forcast API" do
  it 'returns the current weather' do
    VCR.use_cassette "Forcast" do
      get '/api/v1/forcast?location=denver,co'
      forcast = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(forcast[:data][:attributes][:current_weather][:datetime]).to eq("2021-08-07 00:08:38 -0600")
      expect(forcast[:data][:attributes][:current_weather][:sunrise]).to eq("2021-08-07 06:04:49 -0600")
      expect(forcast[:data][:attributes][:current_weather][:sunset]).to eq("2021-08-07 20:06:33 -0600")
      expect(forcast[:data][:attributes][:current_weather][:temperature]).to eq(68.83)
      expect(forcast[:data][:attributes][:current_weather][:feels_like]).to eq(67.91)
      expect(forcast[:data][:attributes][:current_weather][:humidity]).to eq(53)
      expect(forcast[:data][:attributes][:current_weather][:uvi]).to eq(0)
      expect(forcast[:data][:attributes][:current_weather][:visibility]).to eq(10000)
      expect(forcast[:data][:attributes][:current_weather][:conditions]).to eq("scattered clouds")
      expect(forcast[:data][:attributes][:current_weather][:icon]).to eq("03n")
    end
  end

  it 'returns the daily weather' do
    VCR.use_cassette "Forcast" do
      get '/api/v1/forcast?location=denver,co'
      forcast = JSON.parse(response.body, symbolize_names: true)
      forcast[:data][:attributes][:daily_weather].each do |day|
        expect(day[:date]).to be_a(String)
        expect(day[:sunrise]).to be_a(String)
        expect(day[:sunset]).to be_a(String)
        expect(day[:max_temp]).to be_a(Float)
        expect(day[:min_temp]).to be_a(Float)
        expect(day[:conditions]).to be_a(String)
        expect(day[:icon]).to be_a(String)
      end
      expect(forcast[:data][:attributes][:daily_weather][0][:date]).to eq("07-08-2021")
      expect(forcast[:data][:attributes][:daily_weather][0][:sunrise]).to eq("2021-08-07 06:04:49 -0600")
      expect(forcast[:data][:attributes][:daily_weather][0][:sunset]).to eq("2021-08-07 20:06:33 -0600")
      expect(forcast[:data][:attributes][:daily_weather][0][:max_temp]).to eq(89.1)
      expect(forcast[:data][:attributes][:daily_weather][0][:min_temp]).to eq(68.2)
      expect(forcast[:data][:attributes][:daily_weather][0][:conditions]).to eq("scattered clouds")
      expect(forcast[:data][:attributes][:daily_weather][0][:icon]).to eq("03d")
    end
  end

  it 'returns the hourly weather' do
    VCR.use_cassette "Forcast" do
      get '/api/v1/forcast?location=denver,co'
      forcast = JSON.parse(response.body, symbolize_names: true)
      forcast[:data][:attributes][:hourly_weather].each do |hour|
        expect(hour[:time]).to be_a(String)
        expect(hour[:temperature]).to be_a(Float)
        expect(hour[:conditions]).to be_a(String)
        expect(hour[:icon]).to be_a(String)
      end
      expect(forcast[:data][:attributes][:hourly_weather][0][:time]).to eq("00:00:00")
      expect(forcast[:data][:attributes][:hourly_weather][0][:temperature]).to eq(68.83)
      expect(forcast[:data][:attributes][:hourly_weather][0][:conditions]).to eq("scattered clouds")
      expect(forcast[:data][:attributes][:hourly_weather][0][:icon]).to eq("03n")
    end
  end

  it 'can use metric measurements' do
    VCR.use_cassette 'Metric Forcast' do
      get '/api/v1/forcast?location=denver,co&units=metric'
      forcast = JSON.parse(response.body, symbolize_names: true)

      expect(forcast[:data][:attributes][:hourly_weather][0][:temperature]).to eq(33.85)
    end
  end

  describe 'sad paths' do
    it 'returns error if no params given' do
      get '/api/v1/forcast?'

      expect(response.status).to eq(400)
    end

    it 'returns error if search yeilds no results' do
      get '/api/v1/forcast?location=dsklfjhsdlhfajklsdhflakjhwkebflkuasdbfk'

      expect(response.status).to eq(404)
    end
  end
end