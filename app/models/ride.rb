class Ride
    attr_reader :passenger, :driver, :distance

    @@all = []

    def initialize(passenger, driver, distance)
        @passenger = passenger
        @driver = driver
        @distance = distance.to_f
        @@all << self
    end

    def self.all
        @@all
    end

    def self.average_distance
        total = self.all.map{ |ride| ride.distance }.sum
        binding.pry
        total / self.all.length
    end
end