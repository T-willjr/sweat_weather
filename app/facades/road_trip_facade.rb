class RoadTripFacade 
  class << self
    def get_road_trip(origin, destination)
      travel_time_seconds = GeocodeSerializer.time_hash(GeocodeFacade.get_route_time(origin, destination))
      if travel_time_seconds[:data][:attributes][:travel_time] == nil 
        road_trip_not_possible(origin, destination)
      else
        travel_time = travel_time_seconds_to_hours(travel_time_seconds)
        forecast_data = ForecastSerializer.hashed_weather_forecast(ForecastFacade.get_weather(destination), travel_time)
        road_trip(origin, destination, travel_time_seconds, forecast_data)
      end
    end 

    private 

    def road_trip(origin, destination, travel_time_seconds, forecast)
      RoadTrip.new(start_city: origin, end_city: destination, 
                   travel_time: travel_time_seconds[:data][:attributes][:travel_time], 
                   temperature: forecast[:data][:attributes][:hourly_weather][:temperature], 
                   conditions: forecast[:data][:attributes][:hourly_weather][:conditions]
                  )
    end 

    def road_trip_not_possible(origin, destination) 
      RoadTrip.new(start_city: origin, end_city: destination, 
                   travel_time: "Impossible", 
                   temperature: "", 
                   conditions: ""
                  )
    end 

    def travel_time_seconds_to_hours(travel_time_seconds) 
      seconds = travel_time_seconds[:data][:attributes][:travel_time]
      Time.at(seconds).utc.strftime("%H").to_i
    end 
  end 
end 

