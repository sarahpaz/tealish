class Tealish::CLI
  def start
    welcome
    flavor_menu
    select_flavor
  end

  def welcome
    puts "     _______ _      "
    puts "     \\      /_]    "
    puts "      \\___ /       "
    puts "Welcome to Tealish!"
  end

  def flavor_menu
    puts "Here are our delicious tea flavor options:"
    puts <<~DOC
      1. Fruity
      2. Spicy
      3. Floral
      4. Minty
    DOC
  end

  def select_flavor
    input = nil
    while input != "exit"
      puts "\nEnter the number for the flavor collection you'd like to view, type 'menu' to go back to the flavor menu, or type 'exit'."
      input = gets.strip.downcase
      case input
      when "1"
        puts "Here is our fruity tea collection:"
        url = "https://tealish.com/collections/fruity"
        Tealish::Scraper.scrape_teas(url)
    
      when "2"
        puts "Here is our spicy tea collection:"

      when "3"
        puts "Here is our floral tea collection:"
      when "4"
        puts "Here is our minty tea collection:"
      when "exit"
        puts "Thanks for visiting. See you again soon!"
      when "menu"
        flavor_menu
      else
        puts "Sorry, that wasn't a valid option. Please enter a number between 1 - 4, 'menu' or 'exit'."
      end
    end
  end
end
