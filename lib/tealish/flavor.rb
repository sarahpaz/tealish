class Tealish::Flavor
    attr_accessor :flavor_name
    attr_reader :teas 

    @@all = []

    def initialize(flavor_name)
        @type = type
        @teas = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_tea(tea)
        self.teas << tea
        tea.flavor = self
    end
end 