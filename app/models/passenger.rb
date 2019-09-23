class Passenger
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
            ride.passenger == self
        end
    end

    def drivers
        x = self.rides
        x.map{ |ride| ride.driver }
    end

    def total_distance
       self.rides.map{ |ride| ride.distance }.reduce(:+)
    end

    def self.premium_members
        self.all.select{ |passenger| passenger.total_distance > 100 }
    end
end