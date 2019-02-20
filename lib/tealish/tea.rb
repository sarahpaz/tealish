class Tealish::Tea
  attr_accessor :name, :type, :price, :url

  @all = []

  def all_teas
    @all << self
    binding.pry
  end

end
