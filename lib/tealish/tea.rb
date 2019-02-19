class Tealish::Tea
  attr_accessor :name, :type, :price, :url

  @@all_teas = []

  def initialize(tea_attributes)
    tea_attributes.each {|key, value| self.send("#{key}="), value}
    @@all_teas << self
  end
     
  def self.list

  end
end
