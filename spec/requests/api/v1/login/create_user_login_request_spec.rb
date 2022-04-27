require 'rails_helper'

RSpec.describe "Creates A User Login" do  
  it "creates one user login" do 
    data_keys = [:type, :id, :attributes]
    attribute_keys = [:email, :api_key]
    user = User.create!(email: "test@email.com", password: "12345", password_confirmation: "12345")

    session_params = 
        { 
           "email": "test@email.com",
           "password": "12345", 
           "password_confirmation": "12345"
        }
     
 
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session_params)
    
    user_result = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to have_http_status(200)
		expect(user.email).to eq(session_params[:email])
		expect(user.id).to eq(user_result[:data][:id])
		expect(user.private_api_key).to eq(user_result[:data][:attributes][:api_key])
    

    expect(user_result.count).to eq(1)
    expect(user_result[:data].keys.count).to eq(3)
    expect(user_result[:data].keys).to eq(data_keys)

    expect(user_result[:data][:attributes].keys.count).to eq(2)
    expect(user_result[:data][:attributes].keys).to eq(attribute_keys)
  end 

  it "will not get user session if passwords do not match and returns error response" do 
    data_keys = [:type, :id, :attributes]
    attribute_keys = [:error]
    successful_keys = [:email, :api_key]
    user = User.create!(email: "test@email.com", password: "12345", password_confirmation: "12345")

    session_params = 
        { 
           "email": "test@email.com",
           "password": "12345", 
           "password_confirmation": "123456789"
        }
     
 
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session_params)

    error_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(400)

    expect(error_response.count).to eq(1)
    expect(error_response[:data].keys.count).to eq(3)
    expect(error_response[:data].keys).to eq(data_keys)

    expect(error_response[:data][:attributes].keys.count).to eq(1)
    expect(error_response[:data][:attributes].keys).to eq(attribute_keys)
    expect(error_response[:data][:attributes].keys).to_not eq(successful_keys)
    expect(error_response[:data][:attributes][:error][:message]).to eq("Your email or password is incorrect")
  end

  it "will not get user session if email does not exist and returns error response" do 
    data_keys = [:type, :id, :attributes]
    attribute_keys = [:error]
    successful_keys = [:email, :api_key]
    user = User.create!(email: "test@email.com", password: "12345", password_confirmation: "12345")

    session_params = 
        { 
           "email": "",
           "password": "12345", 
           "password_confirmation": "12345"
        }
     
 
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session_params)

    error_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(400)
    

    expect(error_response.count).to eq(1)
    expect(error_response[:data].keys.count).to eq(3)
    expect(error_response[:data].keys).to eq(data_keys)

    expect(error_response[:data][:attributes].keys.count).to eq(1)
    expect(error_response[:data][:attributes].keys).to eq(attribute_keys)
    expect(error_response[:data][:attributes].keys).to_not eq(successful_keys)
    expect(error_response[:data][:attributes][:error][:message]).to eq("Your email or password is incorrect")
  end
end 