class GeocodeFacade 
  class << self 
    def get_lat_long(city) 
      data = GeocodeService.call_lat_long(city)
      latitude_longitude(data)
    end 

    def get_route_time(start, destination)
      GeocodeService.call_route_time(start, destination)
    end 

    private 

    def latitude_longitude(geocode_data)
      lat_long = geocode_data[:results].last[:locations].first[:latLng]
      CityLatLong.new(latitude: lat_long[:lat], longitude: lat_long[:lng])
    end 
  end
end 