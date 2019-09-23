class Ride
    attr_reader :passenger, :driver, :distance

    @@all = []

    # Because a ride belongs to a passenger, and a ride belongs to a driver, ride is the model responsible for keeping track of those relationships
    def initialize(passenger, driver, distance)
        @passenger = passenger
        @driver = driver
        @distance = distance
        @@all << self
    end

    def self.all
        @@all
    end

    def self.average_distance
        total_distance = 0
        self.all.map{ |ride| total_distance += ride.distance }
        total_distance / self.all.length
    end
end