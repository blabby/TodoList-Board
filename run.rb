    require_relative "board.rb"

    TODO_BOARD = Board.new
    TODO_BOARD.add_todo("stuff", "test_todo", "1111-10-10")

    puts "Enter command:"

    com = gets.chomp
    command, *action = [com]

    case command
    when "display"
        TODO_BOARD.display
    when "add"
        TODO_BOARD.add_list(action)
        TODO_BOARD.display
    end

    puts TODO_BOARD.display