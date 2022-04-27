require 'rails_helper'

RSpec.describe "City Latitude Longitude" do 
  it "exists" do 
    
  road_trip = RoadTrip.new(start_city: "origin", end_city: "destination", 
                   travel_time: 5345345, 
                   temperature: 66.2, 
                   conditions: "cool"
                  )
    
    expect(road_trip).to be_an_instance_of RoadTrip
    expect(road_trip.start_city).to eq("origin")
    expect(road_trip.end_city).to eq("destination")
    expect(road_trip.travel_time).to eq("20 hours 49 minutes")
    expect(road_trip.temperature).to eq(66.2)
    expect(road_trip.conditions).to eq("cool")
  end 
end 