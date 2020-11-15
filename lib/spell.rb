#all standard classes and methods
#rename it once we get an idea of what the name of API is.

class Spell
    attr_accessor :index, :name, :url
    attr_reader :description
    @@all = []
    
    def initialize(index, name, url)
        @index = index
        @name = name
        @url = url
        @@all << self
    end


    def self.all
        @@all
    end

end