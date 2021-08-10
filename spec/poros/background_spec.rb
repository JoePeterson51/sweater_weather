require 'rails_helper'

RSpec.describe Background do
  it 'creates a background object' do
    VCR.use_cassette "Background Image" do
      background = BackgroundService.get_background("denver,co")
      background = Background.new(background, 'denver,co')

      expect(background.class).to eq(Background)
      expect(background.id).to eq(nil)
      expect(background.credit[:source]).to eq("unsplash.com")
      expect(background.credit[:author]).to eq("Ryan De Hamer")
      expect(background.credit[:logo]).to eq("https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg")
      expect(background.image[:location]).to eq("denver,co")
      expect(background.image[:image_url]).to eq("https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyNTIwMDd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg1MzYwODI&ixlib=rb-1.2.1")
    end
  end
end