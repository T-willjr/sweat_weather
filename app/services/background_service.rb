class BackgroundService 
  class << self 
    
    def call_city_image(location)
      response = conn.get("/images/search?q=#{location}&count=1")
      parse_data(response)
    end 

    def conn 
      Faraday.new(url: "https://bing-image-search1.p.rapidapi.com") do |faraday|
        faraday.headers["X-RapidAPI-Key"] = ENV['image_key']
      end 
    end 

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end 
  end 
end 