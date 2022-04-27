require 'rails_helper'

  RSpec.describe BackgroundService do
       
    it "call for a city image"do 
      location = "New York City"
      response = BackgroundService.call_city_image(location)
      
      expect(response).to be_a(Hash)
      expect(response[:value].first).to have_key(:thumbnailUrl)
      expect(response[:queryContext]).to have_key(:originalQuery)
    end 
 end