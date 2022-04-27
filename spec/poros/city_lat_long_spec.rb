require 'rails_helper'

RSpec.describe "City Latitude Longitude" do 
  it "exists" do 
   
    citylatlong = CityLatLong.new(latitude: 1.222, longitude: 3.444)
    
    expect(citylatlong).to be_an_instance_of CityLatLong
    expect(citylatlong.latitude).to eq(1.222)
    expect(citylatlong.longitude).to eq(3.444)
  end 
end 