class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]
    render json: ForecastSerializer.hashed(ForecastFacade.get_weather(location))
  end 
end 