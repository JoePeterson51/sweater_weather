class BackgroundService
  def self.get_background(search)
    url = 'https://api.unsplash.com/search/photos'
    response = Faraday.get(url,
      {
        page: 1,
        per_page: 1,
        query: search,
        client_id: ENV['UNSPLASH_API_KEY']
      })
    JSON.parse(response.body, symbolize_names: true)
  end
end