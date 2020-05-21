require_relative "item.rb"
require_relative "list.rb"

class Board
    attr_reader :lists
    def initialize
        @lists = [List.new("stuff")]
    end

    def add_list(name)
        @lists << List.new(name)
    end

    def display
        @lists.each_with_index do |list,i|
            puts "**********************************#{list.name}******************************************"
            list.todos.each_with_index do |todo, i|
                puts "Index: #{i} | Todo: #{todo.name} | Deadline: #{todo.deadline} | Done: #{todo.done} |" 
            end
    end
    end




    def delete_list(name)
        @lists.each_with_index do |l, i|
            if l.name == name
                @lists.delete_at(i)
            end
        end
    end

    def add_todo(list, name, deadline)
        @lists.each do |l|
            if l.name == list
                l.add_todo(name, deadline)
        end
    end
end
end