require 'rails_helper'

RSpec.describe "Gets Food & Forecast for a ctiy" do
  
  xit "gets food & forecast for a ctiy" do  
    city = "pueblo,co"
    start = "denver,co"
    food = "chinese"
    data_keys = :id, :type, :attributes
    attribute_keys = [:destination_city, :travel_time, :forecast, :restaurant]
    forecast_keys = [:summary, :temperature]
    restaurant_keys = [:name, :address]

    get "/api/v1/munchies?start=#{start}&destination=#{city}&food=#{food}"

    food_forecast_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(food_forecast_result.count).to eq(1)
    expect(food_forecast_result[:data].keys.count).to eq(3)
    expect(food_forecast_result[:data].keys).to eq(data_keys)

    expect(food_forecast_result[:data][:attributes].keys.count).to eq(4)
    expect(food_forecast_result[:data][:attributes].keys).to eq(attribute_keys)

    expect(food_forecast_result[:data][:attributes][:forecast].keys.count).to eq(2)
    expect(food_forecast_result[:data][:attributes][:forecast].keys).to eq(forecast_keys)

    expect(food_forecast_result[:data][:attributes][:restaurant].keys.count).to eq(2)
    expect(food_forecast_result[:data][:attributes][:restaurant].keys).to eq(restaurant_keys)
  end 
end 