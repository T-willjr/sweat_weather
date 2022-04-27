require 'rails_helper'

  RSpec.describe ForecastService do
       
    it "call for a city's weather forecast"do 
      latitude = 41.947239
      longitude = -87.655636

      attribute_keys = [:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily]

      response = ForecastService.call_weather(latitude, longitude)
      
      expect(response).to be_a(Hash)
      expect(response.keys).to eq(attribute_keys)
    end 
 end