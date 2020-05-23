require_relative "list.rb"

class TodoBoard
    def initialize
        @board = {}
    end

    def get_command
        puts "enter command: (help to see all commands)" 
        command = gets.chomp.split(" ")
        cmd, *args = command
    
        case cmd
        when "help"
            puts "put in each command followed by the appropriate spacing for other arguments"
            puts "follow the example template Ex: command argument1 argument2 argument3 etc"
            puts "commands are:"
            puts "add_list Ex: add_list groceries"
            puts "add_todo Ex: add_todo groceries shopping 2020-10-30 need to finish buying clothes"
            puts "delete_list Ex:delete_list groceries"
            puts "delete_todo Ex:delete_todo groceries 0"
            puts "display_all Ex: display_all groceries"
            puts "display_todo Ex: display_todo groceries 0"
            puts "toggle Ex:toggle groceries 0 "
            puts "purge Ex:purge groceries"
            puts "exit Exits application"
        when "add_list" #Ex: add_list groceries
            @board[*args] = List.new(*args)
            true
        when "add_todo" #Ex: add_todo groceries shopping 1234-10-10 need to finish buying clothes
            list, *item_info = args
            name, deadline, *description = item_info
            description = description.join(" ")
            @board[list].todos << Item.new(name, deadline, description)
            true
        when "delete_list" #delete_list groceries check if this works
            @board.delete(*args)
            true
        when "delete_todo" #delete_todo groceries 0
            list, index = args
            @board[list].delete_item(index.to_i)
            true
        when "display_all" #Ex: display_all groceries
            @board[*args].display
            true
        when "display_todo" #Ex: display_todo groceries 0
            list, index = args
            @board[list].description(index.to_i)
            true
        when "toggle" #Ex: toggle groceries 0 
            list, index = args
            @board[list].toggle(index.to_i)
            true
        when "purge" #Ex: purge groceries
            @board[*args].purge_complete
            true
        when "exit" #Exits application
            false
        end
    end

        def run
            while true
                return if !get_command
            end
        end
end

TodoBoard.new.run
