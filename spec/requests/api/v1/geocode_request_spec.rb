require 'rails_helper'

RSpec.describe "Gets Longitude/Latitude for a ctiy" do
  
  it "gets Longitude/Latitude for a ctiy" do  
    city = "Washington,DC"
    keys = ["latitude", "longitude"]

    get "/api/v1/geocode/find?city=#{city}"

    geocode_result = JSON.parse(response.body, symbolize_headers: true)

    expect(response).to be_successful
    expect(geocode_result.count).to eq(2)
    expect(geocode_result.keys).to eq(keys)
    expect(geocode_result.values.first).to be_a Float
    expect(geocode_result.values.last).to be_a Float
  end 
end 