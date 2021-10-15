require './item.rb'
require './list.rb'

class TodoBoard 


    def initialize(label)
        @list = List.new(label)
    end

    def get_command 
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)
            return true 

        when 'up'
            @list.up(*args.map(&:to_i))
        when 'down'
            @list.down(*args.map(&:to_i))
            
        when 'swap'
            @list.swap(*args.to_i)
            return true 

        when 'sort'
            @list.sort_by_date!
            return true 

        when 'priority'
            @list.print_priority
            return true 

        when 'print' 
            if args.length == 0
                @list.print
                return true
            else
                index = args[0]
                @list.print_full_item(index.to_i)
                return true 
            end

        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run 
        command = true 
        while command
            command = self.get_command
        end
        
    end

end