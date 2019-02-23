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
      url = "https://tealish.com/collections/fruity"
      if Tealish::Tea.all_fruity == []
        Tealish::Scraper.scrape_teas(url, "fruity")
      end
      list_of_teas("fruity")
      select_tea("fruity")
    when "2"
      puts "*-*-*     Here are our spicy tea options:     *-*-*".cyan
      url = "https://tealish.com/collections/spicy"
      if Tealish::Tea.all_spicy == []
        Tealish::Scraper.scrape_teas(url, "spicy")
      end
      list_of_teas("spicy")
      select_tea("spicy")
    when "3"
      puts "*-*-*     Here are our floral tea options:     *-*-*".cyan
      url = "https://tealish.com/collections/floral"
      if Tealish::Tea.all_floral == []
        Tealish::Scraper.scrape_teas(url, "floral")
      end
      list_of_teas("floral")
      select_tea("floral")
    else
      puts "Sorry, that is not valid number.".red
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
    max_choice = Tealish::Tea.send("all_#{flavor}").length
    if input.between?(1, max_choice)
      selected_tea = Tealish::Tea.send("all_#{flavor}")[input - 1]
      Tealish::Scraper.scrape_tea_details(selected_tea)
      display_tea(selected_tea)
      options_menu(flavor)
    else
      puts "\nSorry, that option is not valid.".red
      options_menu(flavor)
    end
  end

  def display_tea(tea)
    Tealish::Scraper.scrape_tea_details(tea)
    puts "#{tea.name} - #{tea.type} - #{tea.price}".green
    puts "\nDESCRIPTION:".green
    puts tea.description
    puts "\nINGREDIENTS:".green
    puts tea.ingredients
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
      puts "Sorry, that option is not valid.".red
      options_menu(flavor)
    end
  end

end
