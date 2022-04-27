require 'rails_helper'

RSpec.describe "Gets Road Trip Results" do
  
  it "gets weather for a destination and travel time to that destination" do  
    data_keys = [:id, :type, :attributes]
    attribute_keys = [:start_city, :end_city, :travel_time, :weather_at_eta]
    weather_at_eta_keys = [:temperature, :conditions]
    restaurant_keys = [:name, :address]

    user = User.create!(email: "test@email.com", password: "12345", password_confirmation: "12345")
    road_trip_params =
      {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": user.private_api_key
      }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(road_trip: road_trip_params)

    road_trip_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(road_trip_result.count).to eq(1)
    expect(road_trip_result[:data].keys.count).to eq(3)
    expect(road_trip_result[:data].keys).to eq(data_keys)

    expect(road_trip_result[:data][:attributes].keys.count).to eq(4)
    expect(road_trip_result[:data][:attributes].keys).to eq(attribute_keys)

    expect(road_trip_result[:data][:attributes][:weather_at_eta].keys.count).to eq(2)
    expect(road_trip_result[:data][:attributes][:weather_at_eta].keys).to eq(weather_at_eta_keys)
  end 

  it "will not get road trip if api key is wrong and returns error response" do 
    data_keys = [:type, :id, :attributes]
    attribute_keys = [:error]
    successful_keys = [:start_city, :end_city, :travel_time, :weather_at_eta]

    user = User.create!(email: "test@email.com", password: "12345", password_confirmation: "12345")

    travel_params =
      {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "wrong_api_key_1235151515"
      }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(travel: travel_params)

    error_response = JSON.parse(response.body, symbolize_names: true)

    #expect(response).to have_http_status(201)
    
    expect(error_response.count).to eq(1)
    expect(error_response[:data].keys.count).to eq(3)
    expect(error_response[:data].keys).to eq(data_keys)

    expect(error_response[:data][:attributes].keys.count).to eq(1)
    expect(error_response[:data][:attributes].keys).to eq(attribute_keys)
    expect(error_response[:data][:attributes].keys).to_not eq(successful_keys)
    expect(error_response[:data][:attributes][:error][:message]).to eq("Unauthorized api key")
  end


  it "travel time should be 'impossible' and weather blank when travel from country to country" do  
    data_keys = [:id, :type, :attributes]
    attribute_keys = [:start_city, :end_city, :travel_time, :weather_at_eta]
    weather_at_eta_keys = [:temperature, :conditions]
    restaurant_keys = [:name, :address]

    user = User.create!(email: "test@email.com", password: "12345", password_confirmation: "12345")
    road_trip_params =
      {
        "origin": "New York,NY",
        "destination": "London,UK",
        "api_key": user.private_api_key
      }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(road_trip: road_trip_params)

    road_trip_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(road_trip_result.count).to eq(1)
    expect(road_trip_result[:data].keys.count).to eq(3)
    expect(road_trip_result[:data].keys).to eq(data_keys)

    expect(road_trip_result[:data][:attributes].keys.count).to eq(4)
    expect(road_trip_result[:data][:attributes].keys).to eq(attribute_keys)

    expect(road_trip_result[:data][:attributes][:weather_at_eta].keys.count).to eq(2)
    expect(road_trip_result[:data][:attributes][:weather_at_eta].keys).to eq(weather_at_eta_keys)
    
    expect(road_trip_result[:data][:attributes][:travel_time]).to eq("Impossible")

    expect(road_trip_result[:data][:attributes][:weather_at_eta][:temperature]).to eq("")
    expect(road_trip_result[:data][:attributes][:weather_at_eta][:conditions]).to eq("")
  end 
end 