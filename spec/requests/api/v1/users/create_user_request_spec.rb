require 'rails_helper'

RSpec.describe "Creates A User" do  
  it "creates one user" do 
    data_keys = [:type, :id, :attributes]
    attribute_keys = [:email, :api_key]

    users_params = 
        { 
           "email": "test@email.com",
           "password": "12345", 
           "password_confirmation": "12345"
        }
     
 
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(users: users_params)
    
    created_user_result = JSON.parse(response.body, symbolize_names: true)

    created_user = User.first
    expect(response).to have_http_status(201)
    
		expect(created_user.email).to eq(user_params[:email])
		expect(created_user.id).to eq(created_user_result[:data][:id])


    expect(created_user_result.count).to eq(1)
    expect(created_user_result[:data].keys.count).to eq(3)
    expect(created_user_result[:data].keys).to eq(data_keys)

    expect(created_user_result[:data][:attributes].keys.count).to eq(2)
    expect(created_user_result[:data][:attributes].keys).to eq(attribute_keys)
  end 

  it "will not create user if passwords do not match and returns error response" do 
    data_keys = [:type, :id, :attributes]
    attribute_keys = [:error]
    successful_keys = [:email, :api_key]

    users_params = 
        { 
           "email": "test@email.com",
           "password": "12345", 
           "password_confirmation": "123456789"
        }
     
 
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(users: users_params)

    error_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(201)
    

    expect(error_response.count).to eq(1)
    expect(error_response[:data].keys.count).to eq(3)
    expect(error_response[:data].keys).to eq(data_keys)

    expect(error_response[:data][:attributes].keys.count).to eq(1)
    expect(error_response[:data][:attributes].keys).to eq(attribute_keys)
    expect(error_response[:data][:attributes].keys).to_not eq(successful_keys)
    expect(error_response[:data][:attributes][:error][:message]).to eq("Password confirmation doesn't match Password")
  end

  it "will not create user if email does not exist and returns error response" do 
    data_keys = [:type, :id, :attributes]
    attribute_keys = [:error]
    successful_keys = [:email, :api_key]

    users_params = 
        { 
           "email": "",
           "password": "12345", 
           "password_confirmation": "12345"
        }
     
 
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user: users_params)

    error_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(201)
    

    expect(error_response.count).to eq(1)
    expect(error_response[:data].keys.count).to eq(3)
    expect(error_response[:data].keys).to eq(data_keys)

    expect(error_response[:data][:attributes].keys.count).to eq(1)
    expect(error_response[:data][:attributes].keys).to eq(attribute_keys)
    expect(error_response[:data][:attributes].keys).to_not eq(successful_keys)
    expect(error_response[:data][:attributes][:error][:message]).to eq("Email can't be blank")
  end
end 