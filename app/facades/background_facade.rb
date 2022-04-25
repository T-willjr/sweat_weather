class BackgroundFacade  
  class << self  
    def get_city_image(location)
      BackgroundService.call_city_image(location)
    end 
  end 
end 