require_relative "item.rb"
require_relative "list.rb"

class Board
    def initialize
        @lists = []
    end

    def add_list(name)
        @lists << List.new(name)
    end

    def add_todo(list, name, deadline)
        @lists.each do |l|
            if l.name == list.name
                l.add_todo(name, deadline)
        end
    end
end