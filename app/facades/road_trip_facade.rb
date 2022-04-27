class RoadTripFacade 
  class << self
    def get_road_trip(origin, destination)
      route_time = GeocodeSerializer.time_hash(GeocodeFacade.get_route_time(origin, destination))
      forecast_data = ForecastSerializer.hashed(ForecastFacade.get_weather(destination))
      road_trip(origin, destination, route_time, forecast_data)
    end 

    private 

    def road_trip(origin, destination, route_time, forecast)
      RoadTrip.new(start_city: origin, end_city: destination, 
                   travel_time: route_time[:data][:attributes][:travel_time], 
                   temperature: forecast[:data][:attributes][:current_weather][:temperature], 
                   conditions: forecast[:data][:attributes][:current_weather][:conditions]
                  )
    end 


    def route_time(start, destination) 
      route_time = GeocodeSerializer.time_hash(GeocodeFacade.get_route_time(start, destination))
      time_in_seconds = route_time[:data][:attributes][:travel_time]
    end 
  end 
end 

