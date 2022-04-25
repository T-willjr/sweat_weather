class Api::V1::GeocodeController < ApplicationController
  def show 
    city = params[:city]
    render json: GeocodeFacade.get_lat_long(city)
  end 

  def time
    start_location = params[:start]
    destination = params[:end]
    render json: GeocodeSerializer.time_hash(GeocodeFacade.get_route_time(start_location, destination))
  end 
end 