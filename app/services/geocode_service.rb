class GeocodeService 
  class << self 
    def call_lat_long(city)
      response = conn.post("/geocoding/v1/address?key=#{ENV['api_key']}&location=#{city}")
      parse_data(response)
    end

    def call_route_time(start,destination)
      response = conn.post("/directions/v2/route?key=#{ENV['api_key']}&from=#{start}&to=#{destination}")
      a = parse_data(response)
    end 

    def conn 
      Faraday.new(url: "http://www.mapquestapi.com")
    end 
   
    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end 
  end 
end 