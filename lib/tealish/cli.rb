class Tealish::CLI
  def start
    welcome
    menu
    options
  end

  def welcome
    puts "     _______ _      "
    puts "     \\      /_]    "
    puts "      \\___ /       "
    puts "Welcome to Tealish!"
  end

  def menu
    puts "\nHow would you like to shop today?"
    puts <<~DOC
      1. Fruity
      2. Spicy
      3. Minty
    DOC
  end

  def options
    input = nil
    while input != "exit"
      puts "\nEnter a number between 1 - 3 to select the category, or enter 'exit'."
      input = gets.strip
      case input
      when "1"
        puts "Fruity"
        url = "https://tealish.com/collections/fruity"
        tea_options = Tealish::Scraper.scrape_teas(url)
        tea_options.each.with_index do |tea|
          puts tea.name
        end
      when "2"
        puts "Spicy"
      when "3"
        puts "Minty"
      when "exit"
        puts "Thanks for visiting. See you again soon!"
      when "menu"
        menu
      else
        puts "Sorry, that option is not valid. Please enter a number between 1 - 3, or type 'exit."
      end
    end
  end
end
