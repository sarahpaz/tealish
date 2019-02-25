class Tealish::CLI
  def start
    welcome 
    flavor_list
    menu
  end

  def welcome
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Tealish!').cyan
    puts "Welcome to Tealish!"
  end 

  def flavor_list
    puts "\nLet's start by selecting a flavor collection."
    puts "1. Fruity".cyan
    puts "2. Spicy".cyan
    puts "3. Floral".cyan
  end

  def menu
    puts "\nEnter the number of the flavor collection you would like to view:"
    input = nil
    input = gets.strip
    case input
    when "1"
      puts "*-*-*     Here are our Fruity tea options:     *-*-*".cyan
      @flavor = "Fruity"
      if Tealish::Teas.find_by_flavor(@flavor) == []
      Tealish::Scraper.scrape_teas(@flavor) 
      end
      list_of_teas
      select_tea
    when "2"
      puts "*-*-*     Here are our Spicy tea options:     *-*-*".cyan
      @flavor = "Spicy"
      if Tealish::Teas.find_by_flavor(@flavor) == []
        Tealish::Scraper.scrape_teas(@flavor) 
        end
      list_of_teas
      select_tea
    when "3"
      puts "*-*-*     Here are our Floral tea options:     *-*-*".cyan
      @flavor = "Floral"
      if Tealish::Teas.find_by_flavor(@flavor) == []
        Tealish::Scraper.scrape_teas(@flavor) 
        end
      list_of_teas
      select_tea
    else
      invalid_input
      menu
    end
  end

  def list_of_teas
    Tealish::Teas.find_by_flavor(@flavor).each.with_index(1) do |tea, index|
      puts "\n#{index}. #{tea.name} - #{tea.type} - #{tea.price}".cyan
      puts "#{tea.url}"
    end
  end

  def select_tea
    puts "\nEnter a number for more details:"
    input = gets.strip.to_i
    max_options = Tealish::Teas.find_by_flavor(@flavor).size 

    if input.between?(1, max_options)
      selected_tea = Tealish::Teas.find_by_flavor(@flavor)[input - 1] 
      display_tea(selected_tea)
      options_menu
    else
      invalid_input
      select_tea
      options_menu
    end
  end

  def display_tea(tea)
    puts "#{tea.name} - #{tea.type} - #{tea.price}".green
    if tea.description || tea.ingredients == nil
      Tealish::Scraper.scrape_tea_details(tea)
      puts "\nDESCRIPTION:".green
      puts tea.description.capitalize
      puts "\nINGREDIENTS:".green
      puts tea.ingredients.capitalize
    end
  end

  def options_menu
    puts "\nType" + " 'list' ".cyan + "to view another tea," + " 'exit' ".cyan + "to exit, or" + " 'menu' ".cyan + 
    "to return to our flavor menu:"
    input = gets.strip.downcase
    case input
    when "list"
      list_of_teas
      select_tea
    when 'exit' 
      puts "Thanks for visiting Tealish, we hope to see you again soon!"
    when 'menu'
      flavor_list
      menu
    else 
      invalid_input
      options_menu
    end
  end

  def invalid_input
    puts "\nSorry, that option is not valid.".red
  end
end