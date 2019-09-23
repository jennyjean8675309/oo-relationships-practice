require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Create instances of each model that you can test your code on in this file
ernie = Passenger.new("Ernie")
bert = Passenger.new("Bert")
elmo = Passenger.new("Elmo")

big_bird = Driver.new("Big Bird")
count = Driver.new("The Count")
oscar = Driver.new("Oscar")

ride1 = Ride.new(ernie, big_bird, 10.0)
ride2 = Ride.new(bert, big_bird, 50.0)
ride3 = Ride.new(elmo, count, 6)
ride4 = Ride.new(elmo, oscar, 75)
ride5 = Ride.new(elmo, count, 100)
ride6 = Ride.new(ernie, count, 50)

ernie.drivers
elmo.total_distance

puts "Passenger has a class method, premium_members that returns all members who have traveled over 100 miles"
puts Passenger.premium_members.include?(elmo) == true
puts Passenger.premium_members.include?(ernie) == false
puts Passenger.premium_members.include?(bert) == false

puts "Driver has an instance method, rides, that returns all rides a driver has given"
puts big_bird.rides.include?(ride1) == true
puts big_bird.rides.include?(ride2) == true
puts big_bird.rides.include?(ride5) == false 

puts "Driver has an instance method, passengers, that returns all passengers a driver has given a ride to"
puts oscar.passengers.include?(elmo) == true
puts count.passengers.include?(elmo) == true
puts oscar.passengers.include?(bert) == false

puts "Driver.mileage_cap returns all drivers who have exceeded a certain distance"
puts Driver.mileage_cap(80).include?(count) == true
puts Driver.mileage_cap(80).include?(big_bird) == false

Ride.average_distance
binding.pry
0
