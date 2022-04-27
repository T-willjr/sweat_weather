require 'rails_helper'

  RSpec.describe GeocodeService do
       
    it "call for a city's latitude & longitude"do 
      city = "New York City,NY"


      response = GeocodeService.call_lat_long(city)

      expect(response).to be_a(Hash)
      expect(response[:results].first[:locations].first).to have_key(:latLng)
      expect(response[:results].first[:locations].first[:latLng].keys).to eq([:lat, :lng])
      expect(response[:results].first[:locations].first[:latLng][:lat]).to be_a Float
      expect(response[:results].first[:locations].first[:latLng][:lng]).to be_a Float
    end 

    it "call for a route time from city to city"do 
      start = "New York City, NY"
      destination = "Denver,CO"


      response = GeocodeService.call_route_time(start, destination)

      expect(response).to be_a(Hash)
      expect(response[:route]).to have_key(:realTime)
      expect(response[:route][:realTime]).to be_an Integer
    end 
 end