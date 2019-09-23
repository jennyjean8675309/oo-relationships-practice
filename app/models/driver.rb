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

    # though the deliverables don't ask for it, because we know that we need a way of checking each driver's total mileage in order to determine which drivers have exceeded a certain mileage, it's a good idea to create a helper method
    def total_distance
        total_distance = 0
        self.rides.map{ |ride| total_distance += ride.distance }
        total_distance
    end

    def self.mileage_cap(distance)
        self.all.select{ |driver| driver.total_distance > distance }
    end
end