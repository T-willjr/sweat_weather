class ForecastSerializer 
  def self.hashed(weather)
    { 
      "data": { 
         "id": nil, 
         "type": "forecast", 
         "attributes": {
           "current_weather": { 
             "datetime": Time.at(weather[:current][:dt]),
             "sunrise": Time.at(weather[:current][:sunrise]),
             "sunset": Time.at(weather[:current][:sunset]),
             "temperature": weather[:current][:temp],
             "feels_like": weather[:current][:feels_like],
             "humidity": weather[:current][:humidity],
             "uvi": weather[:current][:uvi],
             "visibility": weather[:current][:visibility],
             "conditions": weather[:current][:weather].first[:description],
             "icon": weather[:current][:weather].first[:icon]
              },
             "daily_weather":  weather[:daily][0..4].map do |daily_weather| 
              {
              "date": Time.at(daily_weather[:dt]),
              "sunrise": Time.at(daily_weather[:sunrise]),
              "sunset": Time.at(daily_weather[:sunset]),
              "max_temp": daily_weather[:temp][:max],
              "min_temp": daily_weather[:temp][:min],
              "conditions": daily_weather[:weather].first[:description],
              "icon": daily_weather[:weather].first[:icon]
            }
          end,
             "hourly_weather":  weather[:hourly][0..7].map do |hourly_weather|
                { 
                "time": Time.at(hourly_weather[:dt]).gmtime.strftime("%H:%M:%S"),
                "temperature": hourly_weather[:temp],
                "conditions": hourly_weather[:weather].first[:description],
                "icon": hourly_weather[:weather].first[:icon]
                }
          end
          }
       }
     }
  end
end 