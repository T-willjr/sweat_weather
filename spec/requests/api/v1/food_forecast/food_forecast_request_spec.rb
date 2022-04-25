require 'rails_helper'

RSpec.describe "Gets Food & Forecast for a ctiy" do
  
  it "gets food & forecast for a ctiy" do  
    city = "pueblo,co"
    start = "denver,co"
    food = "chinese"

    get "/api/v1/munchies?start=#{start}&destination=#{city}&food=#{food}"

    food_forecast_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(food_forecast_result.count).to eq(1)
    expect(food_forecast_result[:data].keys.count).to eq(3)
    expect(food_forecast_result[:data].keys).to eq(data_keys)
    expect(food_forecast_result[:data][:attributes][:image].keys.count).to eq(2)
    expect(food_forecast_result[:data][:attributes][:image].keys).to eq(image_keys)
  end 
end 