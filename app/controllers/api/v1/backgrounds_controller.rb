class Api::V1::BackgroundsController < ApplicationController 
  def index 
    location = params[:location]
    render json: BackgroundSerializer.hashed(BackgroundFacade.get_city_image(location))
  end
end 