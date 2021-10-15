
require './item.rb'

class List 
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description= "")
        if Item.valid_date?(deadline)
            item = Item.new(title, deadline, description)
            @items << item 
            return true 
        else
            return false
        end
    end

    def size
        @items.length 
    end

    def valid_index?(index)
        return false if index < 0
        if index > self.size 
            return false
        else
            return true 
        end
    end

    def swap(index1, index2)
        if !valid_index?(index1) || !valid_index?(index2)
            return false 
        else
            @items[index1],@items[index2] = @items[index2],@items[index1]
            return true
        end
    end

    def [](index)
        if !valid_index?(index)
            return nil 
        else
            return @items[index]
        end
    end

    def priority
        @items[0]
        
    end

    def print
        puts "--------------------------"
        puts @label 
        puts "--------------------------"
        puts "Index  |  Item           |Deadline"
        puts "--------------------------"
        @items.each_with_index do |item, i|
            puts "#{i}  | #{item.title}   |#{item.deadline}"
        end
        puts "--------------------------"
    end

    def print_full_item(index)
        if valid_index?(index)
            puts "-------------------------------"
            puts "#{@items[index].title}       #{@items[index].deadline} "
            puts "#{@items[index].description}"
            puts "-------------------------------"
        end
    end

    def print_priority
        print_full_item(0)
    end

     def up(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != 0
            swap(index, index - 1)
            index -= 1
            amount -= 1
        end
        true
    end

    def down(index, amount=1)
        if !valid_index?(index)
            return false 
        else
            if index != @items.size - 1 && index + amount <= @items.size - 1
                amount.times do 
                    self.swap(index, index + 1)
                    index += 1
                end
            elsif index != @items.size - 1 && index + amount > @items.size - 1
                new_amt = (@items.size - 1) - index
                new_amt.times do 
                    self.swap(index, index + 1)
                    index += 1
                end
            end
            
            return true 
        end
    end

    def sort_by_date!
        dates = []
        @items.each_with_index do |item, i|
            date_hash = {"i": nil, "day": nil}
            arr = item.deadline.split("-")
            integer_day = arr[2].to_i
            date_hash["i"] = i 
            date_hash["day"] = integer_day
            dates << date_hash
        end
        
        dates.sort_by! {|date| date["day"]}
        items_copy = @items.dup

        @items.each_with_index do |item, i|
            new_idx = dates[i]["i"]
            @items[i] = items_copy[new_idx]
        end
    end

    

    
end