class Item
    def self.valid_date?(deadline)
    date = deadline.split("-").map(&:to_i)
    year, month, day = date
    return false if date.length != 3
    return false if !(0..12).include?(month)
    return false if !(0..31).include?(day)
    true    
    end

    attr_accessor :name, :description
    attr_reader :done, :deadline
    def initialize(title, deadline, description)
        raise "invalid deadline" if !Item.valid_date?(deadline)
        @name = title
        @deadline = deadline
        @description = description
        @done = true
    end

    def toggle
        @done = !@done
    end 

    def deadline= (new_deadline)
        raise "invalid deadline" if !Item.valid_date?(deadline)
        @deadline = new_deadline
    end
end