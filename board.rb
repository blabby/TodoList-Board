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
        when "add_list" #Ex: add_list groceries
            @board[*args] = List.new(*args)
            true
        when "delete_list" #delete groceries
            @board.delete(*args)
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
        when "exit"
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
