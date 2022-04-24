class ForecastFacade 
  class << self 
    def get_weather(location) 
      lat_long = GeocodeFacade.get_lat_long(location)
      data = ForecastService.call_weather(lat_long.latitude, lat_long.longitude)
    end 

    private 
    
  end
end 