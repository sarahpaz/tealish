class Tealish::Tea
  attr_accessor :name, :type, :price, :url, :ingredients, :description, :flavor
  
  @@all_fruity = []
  @@all_spicy = []
  @@all_floral = []

  def initialize(flavor)
    @flavor = flavor
    case flavor
    when "fruity"
      @@all_fruity << self
    when "spicy"
      @@all_spicy << self
    when "floral"
      @@all_floral << self
    end
  end

  def self.all_fruity
    @@all_fruity
  end

  def self.all_spicy
    @@all_spicy
  end

  def self.all_floral
    @@all_floral
  end
end
