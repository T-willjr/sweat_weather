require 'rails_helper'

RSpec.describe "Gets Background image for a ctiy" do
  
  it "gets Longitude/Latitude for a ctiy" do  
    city = "Washington,DC"
    data_keys = [:type, :id, :attributes]
    image_keys = [:location, :image_url]
    get "/api/v1/backgrounds?location=#{city}"

    background_image_result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(background_image_result.count).to eq(1)
    expect(background_image_result[:data].keys.count).to eq(3)
    expect(background_image_result[:data].keys).to eq(data_keys)
    expect(background_image_result[:data][:attributes][:image].keys.count).to eq(2)
    expect(background_image_result[:data][:attributes][:image].keys).to eq(image_keys)
  end 
end 