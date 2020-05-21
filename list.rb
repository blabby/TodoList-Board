class List
    #done
    attr_accessor :name, :todos
    def initialize(name)
        @name = name
        @todos = []
    end

    def add_todo(name, deadline)
        @todos << Item.new(name, deadline)
    end

    def delete_todo(index)
        @todos.delete_at(index)
    end

    def toggle_todo(index)
        @todos[index].toggle
    end
end