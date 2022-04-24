class ForecastService 
  class << self 
    
    def call_weather(lati, long)
      response = conn.get("/data/2.5/onecall?lat=#{lati}&lon=#{long}&exclude=minutely,alerts&appid=#{ENV['weath_key']}&units=imperial")
      parse_data(response)
    end 

    def conn 
      Faraday.new(url: "https://api.openweathermap.org")
    end 

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end 
  end 
end 