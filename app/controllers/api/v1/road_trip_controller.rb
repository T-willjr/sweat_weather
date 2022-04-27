class Api::V1::RoadTripController < ApplicationController 
  def create 
    origin = params[:travel][:origin]
    destination = params[:travel][:destination]
    api_key = params[:travel][:api_key]
    user = User.find_by(private_api_key: params[:travel][:api_key])

    if user.present?
      render json: RoadTripSerializer.hashed(RoadTripFacade.get_road_trip(origin,destination))
    else 
      render json: MessageSerializer.hashed_api_error
    end 
  end 
end 