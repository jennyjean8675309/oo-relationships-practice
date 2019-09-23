class Driver
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def rides
        Ride.all.select{ |ride| ride.driver == self }
    end

    def passengers
        self.rides.map{ |ride| ride.passenger }
    end

    def total_distance
        self.rides.map{ |ride| ride.distance }.sum
    end

    def self.mileage_cap(distance)
        self.all.select{ |driver| driver.total_distance > distance }
    end
end