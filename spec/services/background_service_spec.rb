require 'rails_helper'

RSpec.describe 'background service' do
  it 'makes a call to unsplash and returns an image' do
    VCR.use_cassette 'Background Image' do
      response = BackgroundService.get_background('denver,co')

      expect(response[:results][0][:urls][:raw]).to eq("https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyNTIwMDd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg1MzYwODI&ixlib=rb-1.2.1")
      expect(response[:results][0][:user][:name]).to eq("Ryan De Hamer")
    end
  end
end