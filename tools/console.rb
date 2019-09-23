require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Classes and instances to test
juju = Passenger.new("Juju")
big = Passenger.new("Big")
porky = Passenger.new("Porky")

jenny = Driver.new("Jenny")
oscar = Driver.new("Oscar")
ernie = Driver.new("Ernie")

ride1 = Ride.new(juju, jenny, 10.0)
ride2 = Ride.new(juju, oscar, 50.0)
ride3 = Ride.new(porky, ernie, 5.0)
ride4 = Ride.new(juju, ernie, 260.0)
ride5 = Ride.new(big, oscar, 15.0)

# Puts-ing out statements to mimic a test file
puts "A passenger is initialized with a name"
# Here we're mimicking test assertions - all tests, no matter which testing framework you use, include code that evaluates to either true or false, to indicate whether a test passes or fails
puts juju.name == "Juju"

puts "******************************"

puts "A driver is initialized with a name"
puts jenny.name == "Jenny"

puts "******************************"

puts "A ride is initialized with a passenger, a driver, and a distance"
puts ride1.passenger == juju
puts ride1.driver == jenny
puts ride1.distance == 10.0

puts "Ride has a class method that returns all rides"
puts Ride.all.include?(ride1) == true
puts Ride.all.include?(juju) == false

puts "Passenger has an instance method that returns all drivers that have driven that passenger"
puts juju.drivers.include?(jenny) == true
puts juju.drivers.include?(oscar) == true
puts juju.drivers.include?(ernie) == false

puts "Passenger has an instance method that returns all rides that a passenger has taken"
puts juju.rides.include?(ride1) == true
puts juju.rides.include?(ride2) == true
puts juju.rides.include?(ride3) == false

puts "Passenger has a class method that returns all passengers"
puts Passenger.all.include?(juju) == true
puts Passenger.all.include?(big) == true
puts Passenger.all.include?(oscar) == false

puts "Passenger has an instance method that returns the total distance a passenger has traveled"
puts juju.total_distance == 60

puts "Passenger has a class method that returns all passengers that had traveled over 100 miles total"
puts Passenger.premium_members.include?(juju) == true
puts Passenger.premium_members.include?(big) == false

puts "******************************"

puts "Driver has a class method that returns all drivers"
puts Driver.all.include?(jenny) == true
puts Driver.all.include?(oscar) == true
puts Driver.all.include?(ernie) == true
puts Driver.all.include?(juju) == false

puts "Driver has an instance method that returns all rides a driver has given"
puts oscar.rides.include?(ride2) == true
puts oscar.rides.include?(ride5) == true
puts oscar.rides.include?(ride1) == false

puts "Driver has an instance method that returns all passengers a driver has given a ride to"
puts jenny.passengers.include?(juju) == true
puts jenny.passengers.include?(porky) == false

puts "Driver has an instance method that returns the total distance each driver has driven"
puts oscar.total_distance == 65.0

puts "Driver has a class method that takes an argument of a distance, and returns all drivers who have exceeded that mileage"
puts Driver.mileage_cap(15).include?(ernie) == true
puts Driver.mileage_cap(15).include?(oscar) == true
puts Driver.mileage_cap(15).include?(jenny) == false
puts Driver.mileage_cap(200).include?(ernie) == true
puts Driver.mileage_cap(200).include?(oscar) == false

puts "Ride has an instance method that returns the passenger for each ride"
puts ride1.passenger == juju

puts "Ride has an instance method that returns the driver for each ride"
puts ride1.driver == jenny

puts "Ride has a class method that returns the average distance for all rides"
puts Ride.average_distance == 68.0

binding.pry
0
