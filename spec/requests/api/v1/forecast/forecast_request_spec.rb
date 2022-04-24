require 'rails_helper'

RSpec.describe "Gets Weather for a ctiy" do
  
  it "gets current, daily, hourly weather for a city" do  
    city = "Washington,DC"
    attribute_keys = [:current_weather, :daily_weather, :hourly_weather]
    excluded_keys = [:minutely, :alerts]

    current_weather_keys = [:datetime, :sunrise, :sunset, :temperature, :feels_like, 
                            :humidity, :uvi, :visibility, :conditions, :icon]
    excluded_weather_keys = [:wind_speed, :wind_deg, :dew_point, :pressure]

    daily_weather_keys = [:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon]
    excluded_daily_weather_keys = [:moonrise, :moonset, :moon_phase, :pressure,
                                    :wind_speed, :wind_deg, :dew_point, :pressure ]

    hourly_weather_keys = [:time, :temperature, :conditions, :icon]
    excluded_hourly_weather_keys = [:wind_gust, :clouds, :uvi, :humidity,
                                    :wind_speed, :wind_deg, :dew_point, :pressure,
                                    :weather, :visibility, :feels_like]

    
    get "/api/v1/forecast?location=#{city}"

    weather_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(weather_result.count).to eq(1)
    expect(weather_result[:data][:id]).to eq(nil)
    expect(weather_result[:data][:attributes].count).to eq(3)
    expect(weather_result[:data][:attributes].keys).to eq(attribute_keys)
    expect(weather_result[:data][:attributes].keys).to_not eq(excluded_keys)

    expect(weather_result[:data][:attributes][:current_weather].count).to eq(10)
    expect(weather_result[:data][:attributes][:current_weather].keys).to eq(current_weather_keys)
    expect(weather_result[:data][:attributes][:current_weather].keys).to_not eq(excluded_weather_keys)

    expect(weather_result[:data][:attributes][:daily_weather].count).to eq(5)
    expect(weather_result[:data][:attributes][:daily_weather].first.keys).to eq(daily_weather_keys)
    expect(weather_result[:data][:attributes][:daily_weather].first.keys).to_not eq(excluded_daily_weather_keys)
    
    expect(weather_result[:data][:attributes][:hourly_weather].count).to eq(8)
    expect(weather_result[:data][:attributes][:hourly_weather].first.keys).to eq(hourly_weather_keys)
    expect(weather_result[:data][:attributes][:hourly_weather].first.keys).to_not eq(excluded_hourly_weather_keys)
  end 
end 