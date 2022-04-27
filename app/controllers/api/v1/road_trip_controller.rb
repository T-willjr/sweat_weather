class Api::V1::RoadTripController < ApplicationController 
  def create 
    origin = params[:road_trip][:origin]
    destination = params[:road_trip][:destination]
    api_key = params[:road_trip][:api_key]
    user = User.find_by(private_api_key: params[:road_trip][:api_key])

    if user.present?
      render json: RoadTripSerializer.hashed(RoadTripFacade.get_road_trip(origin,destination))
    else 
      render json: MessageSerializer.hashed_api_error
    end 
  end 
end 