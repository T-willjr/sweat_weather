class MunchiesFacade 
  class << self
    def get_food_forecast(start, destination, food)
      restaurant_data = MunchiesService.call_restaurant_info(food, destination)
      # travel_data = GeocodeService.call_travel_time(start, destination)
      # forecast_data = ForecastFacade.get_weather(destination)
    end 

    private 

    def food_forecast_object(forecast_data, restaurant_data, travel_data)

    end 
  end 
end 