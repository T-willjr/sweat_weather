class MunchiesSerializer 
  class << self 
    def hashed(time, forecast_data, restaurant_data, destination)
      {
        "data": {
          "id": "null",
          "type": "munchie",
          "attributes": {
            "destination_city": destination,
            "travel_time":  "#{Time.at(time).utc.strftime("%H")} hours #{Time.at(time).utc.strftime("%M").to_i} min", 
            "forecast": {
              "summary": forecast_data[:current][:weather].first[:description],
              "temperature": forecast_data[:current][:temp].to_i
          },
            "restaurant": {
              "name": restaurant_data[:businesses].first[:name],
              "address": restaurant_data[:businesses].first[:location][:display_address].join(" ")
          }
        }
       }
      }
  end
 end 
end 
#%M