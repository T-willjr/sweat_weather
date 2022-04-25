class GeocodeSerializer
  include JSONAPI::Serializer
  attributes :id, :latLng

  class << self 
    def time_hash(data)
      {
        "data": {
          "id": "null",
          "type": "time",
          "attributes": {
            "travel_time": data[:route][:realTime]
       }
     }
  }
    end 
  end 
end