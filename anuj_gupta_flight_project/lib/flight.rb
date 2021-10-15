require 'passenger.rb'

class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true 
        else
            return false
        end
    end

    def board_passenger(passenger)
        if self.full?
        else
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end
    end

    def list_passengers
        name_arr =[]
        @passengers.each do |passenger|
            name_arr << passenger.name
        end
        name_arr
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end