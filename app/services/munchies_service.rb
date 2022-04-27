class MunchiesService 
  class << self 

    def call_restaurant_info(food,destination, time)
      response = conn.get("/v3/businesses/search?location=#{destination}&categories=#{food}&limit=1&open_at=#{time}")
      parse_data(response)
    end 

    def conn 
      Faraday.new(url: "https://api.yelp.com") do |faraday|
        faraday.headers['Authorization'] = ENV['token']
      end 
    end 

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end 
  end 
end 