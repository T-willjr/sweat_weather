class MunchiesFacade 
  class << self
    def get_food_forecast(start, destination, food)
      time = route_time(start,destination)
      time_for_restaurant = Time.now.to_i + time 
      restaurant_data = MunchiesService.call_restaurant_info(food, destination, time_for_restaurant)
      forecast_data = ForecastFacade.get_weather(destination)
      MunchiesSerializer.hashed(time, forecast_data, restaurant_data, destination)
    end 

    private 
    def route_time(start, destination) 
      route_time = GeocodeSerializer.time_hash(GeocodeFacade.get_route_time(start, destination))
      time_in_seconds = route_time[:data][:attributes][:travel_time]
    end 
  end 
end 

