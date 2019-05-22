require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

driver1 = Driver.new("Hagrid")
driver2 = Driver.new("Harry")
driver3 = Driver.new("Ron")

bart = Passenger.new("Bart")
lisa = Passenger.new("Lisa")
maggie = Passenger.new("Maggie")

ride1 = Ride.new(driver1, lisa, 50.0)
ride2 = Ride.new(driver1, bart, 5.0)
ride3 = Ride.new(driver2, bart, 3.5)
ride4 = Ride.new(driver1, maggie, 75.0)
ride5 = Ride.new(driver3, bart, 10.0)
ride6 = Ride.new(driver3, maggie, 10.0)
ride7 = Ride.new(driver3, lisa, 101)

puts Driver.all.include?(driver1) 
puts Driver.all.include?(driver2)
puts Driver.all.include?(driver3)

puts Passenger.all.include?(bart)
puts Passenger.all.include?(lisa)
puts Passenger.all.include?(maggie)

puts "A ride knows its passenger"
puts ride1.passenger == lisa
puts ride3.passenger == bart
puts ride5.passenger == bart

puts "A ride knows its driver"
puts ride2.driver == driver1
puts ride4.driver == driver1
puts ride6.driver == driver3

puts "The Ride class can calculate its average distance"
puts Ride.average_distance

puts "A passenger knows which rides they've taken"
puts bart.rides.include?(ride2)
puts bart.rides.include?(ride3)
puts bart.rides.include?(ride5)
puts bart.rides.include?(ride1) == false

puts "A passenger knows which drivers have taken them on rides"
puts bart.drivers.include?(driver1)
puts bart.drivers.include?(driver2)
puts bart.drivers.include?(driver3)
puts maggie.drivers.include?(driver2) == false

puts "A passenger knows the total distance they've traveled"
puts bart.total_distance == 18.5

puts "The Passenger class knows its premium members"
puts Passenger.premium_members.include?(lisa)
puts Passenger.premium_members.include?(bart) == false

puts "A driver knows about its rides"
puts driver1.rides.include?(ride1)
puts driver1.rides.include?(ride2)
puts driver1.rides.include?(ride4)
puts driver1.rides.include?(ride7) == false

puts "A driver knows which passengers they've driven"
puts driver2.passengers.include?(bart)
puts driver2.passengers.include?(maggie) == false

puts "A driver knows the total distance they've driven"
puts driver2.total_distance == 3.5
puts driver3.total_distance == 121.0

puts "Drivers can be selected by a mileage cap"
puts Driver.mileage_cap(100).include?(driver3)
puts Driver.mileage_cap(100).include?(driver1)
puts Driver.mileage_cap(100).include?(driver2) == false
puts Driver.mileage_cap(125).include?(driver1)
puts Driver.mileage_cap(125).include?(driver3) == false

binding.pry
0
