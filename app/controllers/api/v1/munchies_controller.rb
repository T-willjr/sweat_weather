class Api::V1::MunchiesController < ApplicationController 
  def index 
    start = params[:start] 
    destination = params[:destination]
    food = params[:food]
    render json: MunchiesFacade.get_food_forecast(start, destination, food)
  end 
end 