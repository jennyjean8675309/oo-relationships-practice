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
        Ride.all.select do |ride|
            ride.driver == self
        end
    end

    def passengers
        self.rides.collect do |ride|
            ride.passenger
        end
    end

    def total_distance
        total_distance = 0

        self.rides.each do |ride|
            total_distance += ride.distance
        end

        total_distance
    end

    def self.mileage_cap(mileage)
        self.all.select do |driver|
            driver.total_distance > mileage
        end
    end

    def dummy_method
        "I don't do anything"
    end
end