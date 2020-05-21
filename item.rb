class Item
    attr_accessor :name
    attr_reader :done, :deadline
    def initialize(name, deadline)
        @name = name
        @deadline = deadline
        @done = false
    end

    def toggle
        @done = !@done
    end
end
