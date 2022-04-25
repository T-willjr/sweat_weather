class Api::V1::MunchiesController < ApplicationController 
  def index 
    start = params[:start] 
    destination = params[:destination]
    food = params[:food]
    MunchiesFacade.get_food_forecast(start, destination, food)
  end 
end 