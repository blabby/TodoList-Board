class Item
    #done
    attr_accessor :name
    attr_reader :done
    def initialize(name, deadline)
        @name = name
        @done = false
        @deadline = deadline
    end

    def toggle
        @done = true
    end
end