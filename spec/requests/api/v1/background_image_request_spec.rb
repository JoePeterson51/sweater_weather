require 'rails_helper'

RSpec.describe 'Unsplash API request' do
  it 'returns an image based on a search param' do
    VCR.use_cassette "Background Image" do
      get '/api/v1/backgrounds?location=denver,co'
      background = JSON.parse(response.body, symbolize_names: true)

      expect(background[:data][:id]).to eq(nil)
      expect(background[:data][:type]).to eq("image")
      expect(background[:data][:attributes][:image][:location]).to eq("denver,co")
      expect(background[:data][:attributes][:image][:image_url]).to eq("https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyNTIwMDd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg1MzYwODI&ixlib=rb-1.2.1")
      expect(background[:data][:attributes][:credit][:source]).to eq("unsplash.com")
      expect(background[:data][:attributes][:credit][:author]).to eq("Ryan De Hamer")
      expect(background[:data][:attributes][:credit][:logo]).to eq("https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg")
    end
  end

  it 'returns error if no location sent' do
    get '/api/v1/backgrounds?'

    expect(response.status).to eq(400)
  end

  it 'returns error if no photo found' do
    get '/api/v1/backgrounds?location=alsjkhdfkajlsdhfklajshdfkjlashdfklajsdhfkjasbdfkjbasdklhfgaklsjdhfkasdbjfaksdjf'

    expect(response.status).to eq(404)
  end
end