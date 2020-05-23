require_relative "item.rb"
class List
    attr_accessor :label, :todos
    def initialize(label)
        @label = label
        @todos = [Item.new("test", "1111-10-10", "test2")]
    end

    def display
        puts "----------------------------------------------------"
        puts "                       #{@label}                    "
        puts "----------------------------------------------------"
        @todos.each_with_index do |todo, i|
        puts "Index: #{i} | Title: #{todo.name} | Deadline: #{todo.deadline} | Done: #{complete?(todo.done)} |"
        end
    end

    def description(i)
        puts "Index: #{i} | Description: #{@todos[i].description} |"
    end

    def complete?(todo)
        if todo == false
            "[]"
        else
            "[X]"
        end
    end

    def add_item(name, deadline, description)
        @todos << Item.new(name, deadline, description)
    end

    def delete_item(index)
        @todos.delete_at(index)
    end

    def toggle_complete(index)
        @todos[index].done = !@todos[index].done
    end

    def toggle(index)
        @todos[index].toggle
    end

    def purge_complete
        @todos.delete_if {|item| item.done == true}
    end
end
