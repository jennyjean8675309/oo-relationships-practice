class Ride
    attr_reader :driver, :passenger, :distance
    @@all = []

    def initialize(driver, passenger, distance)
        @driver = driver
        @passenger = passenger
        @distance = distance
        @@all << self
    end

    def self.all
        @@all
    end

    def self.average_distance
        total_distance = 0
        
        self.all.each do |ride|
            total_distance += ride.distance
        end

        number_of_rides = self.all.length

        average = (total_distance / number_of_rides).round(2)
    end
end