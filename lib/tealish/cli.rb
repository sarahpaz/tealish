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
    puts "Let's start by selecting a flavor collection."
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
      puts "*-*-*     Here are our fruity tea options:     *-*-*".cyan
      if Tealish::Tea.all_fruity == []
        Tealish::Scraper.scrape_teas("fruity")
      end
      list_of_teas("fruity")
      select_tea("fruity")
    when "2"
      puts "*-*-*     Here are our spicy tea options:     *-*-*".cyan
      if Tealish::Tea.all_spicy == []
        Tealish::Scraper.scrape_teas("spicy")
      end
      list_of_teas("spicy")
      select_tea("spicy")
    when "3"
      puts "*-*-*     Here are our floral tea options:     *-*-*".cyan
      if Tealish::Tea.all_floral == []
        Tealish::Scraper.scrape_teas("floral")
      end
      list_of_teas("floral")
      select_tea("floral")
    else
      invalid_input
      menu
    end
  end

  def list_of_teas(flavor)
    Tealish::Tea.send("all_#{flavor}").each.with_index(1) do |tea, index| 
      puts "\n#{index}. #{tea.name} - #{tea.type} - #{tea.price}".cyan
      puts "#{tea.url}"
    end
  end

  def select_tea(flavor)
    puts "\nEnter a number for more details:"
    input = gets.strip.to_i
    max_options = Tealish::Tea.send("all_#{flavor}").size 
    if input.between?(1, max_options)
      selected_tea = Tealish::Tea.send("all_#{flavor}")[input - 1] 
      Tealish::Scraper.scrape_tea_details(selected_tea)
      display_tea(selected_tea)
      options_menu(flavor)
    else
      invalid_input
      select_tea(flavor)
      options_menu(flavor)
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

  def options_menu(flavor)
    puts "\nType" + " 'y' ".cyan + "to view another tea," + " 'n' ".cyan + "to exit, or" + " 'menu' ".cyan + 
    "to return to our flavor menu:"
    input = gets.strip.downcase
    case input
    when "y"
      list_of_teas(flavor)
      select_tea(flavor)
    when 'n' 
      puts "Thanks for visiting Tealish, we hope to see you again soon!"
    when 'menu'
      flavor_list
      menu
    else 
      invalid_input
      options_menu(flavor)
    end
  end

  def invalid_input
    puts "\nSorry, that option is not valid.".red
  end
end
