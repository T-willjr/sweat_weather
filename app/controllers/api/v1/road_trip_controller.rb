class Api::V1::RoadTripController < ApplicationController 
  after_action :set_code_on_create, only: [:create]

  def create 
    origin = params[:road_trip][:origin]
    destination = params[:road_trip][:destination]
    api_key = params[:road_trip][:api_key]
    @user = User.find_by(private_api_key: params[:road_trip][:api_key])

    if @user.present?
      render json: RoadTripSerializer.hashed(RoadTripFacade.get_road_trip(origin,destination))
    else 
      render json: MessageSerializer.hashed_api_error
    end 
  end 

  private 

  def set_code_on_create
    if @user.present?
      response.status = 200
    else  
      response.status = 400 if response.status == 200
    end 
  end
end 