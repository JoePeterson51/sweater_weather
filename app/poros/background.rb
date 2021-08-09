class Background
  attr_reader :id, :image, :credit
  def initialize(data, search)
    @id = nil
    @image =
    {
      location: search,
      image_url: data[:results][0][:urls][:raw]
    }
    @credit =
    {
      source: "unsplash.com",
      author: data[:results][0][:user][:name],
      logo: 'https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg'
    }
  end
end