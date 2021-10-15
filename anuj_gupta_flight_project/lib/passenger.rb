class Passenger 
    attr_reader :name


    def initialize(name)
        @name = name 
        @flight_numbers = []
    end


    def has_flight?(flight_number)
        @flight_numbers.each do |ele|
            downcase_ele = ele.downcase 
            if downcase_ele == flight_number || ele == flight_number
                return true 
            end
        end
        false
    end

    def add_flight(flight_number)
        if !self.has_flight?(flight_number)
            uppercase_flight_num = flight_number.upcase
            @flight_numbers << uppercase_flight_num
        end
    end
    
end