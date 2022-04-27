class RoadTrip 
  attr_reader :start_city, 
              :end_city,
              :travel_time, 
              :temperature, 
              :conditions

  def initialize(data)
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = change_time_format(data[:travel_time])
    @temperature = data[:temperature].to_i
    @conditions = data[:conditions]
  end 

  def change_time_format(time)
    "#{Time.at(time).utc.strftime("%H")} hours #{Time.at(time).utc.strftime("%M").to_i} minutes"
  end 
end 