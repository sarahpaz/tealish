class Tealish::Teas
  attr_accessor :name, :type, :price, :url, :ingredients, :description, :flavor

  @@all = [] 
  
  def initialize(flavor)
    @flavor = flavor
    @@all << self
  end

  def self.all 
    @@all
  end

  def self.find_by_flavor(flavor)
    all.select {|tea| tea.flavor == flavor} 
  end
end