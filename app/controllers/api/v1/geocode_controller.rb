class Api::V1::GeocodeController < ApplicationController
  def show 
    city = params[:city]
    render json: GeocodeFacade.get_lat_long(city)
  end 
end 