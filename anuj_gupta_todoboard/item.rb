require 'byebug'

class Item 
    attr_accessor :title, :deadline, :description

    def self.valid_date?(date_string)
        arr = date_string.split("-")
        return false if arr[0].length != 4
        return false if arr[1].length != 2
        return false if arr[2].length != 2
        month = arr[1].to_i
        day = arr[2].to_i
        if (1..12).include?(month) && (1..31).include?(day)
            return true 
        end
        false
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        if !Item.valid_date?(@deadline)
            raise "Invalid date" 
        end
    end

    
end




