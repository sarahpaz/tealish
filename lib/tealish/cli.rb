class Tealish::CLI
  def start
    welcome
    menu
    options
  end

  def welcome
    puts "     _______ _      ".cyan
    puts "     \\      /_]    ".cyan
    puts "      \\___ /       ".cyan
    puts "Welcome to Tealish!"
  end

  def menu
    puts "\nHow would you like to shop today?"
    puts "1. Fruity".green
    puts "2. Spicy".red
    puts "3. Floral".magenta
  end

  def options
    input = nil
    while input != "exit"
      input = gets.strip
      case input
      when "1"
        puts "*-*-*     Here are our fruity tea options:     *-*-*".green
        scrape_fruity_teas
        input_options
      when "2"
        puts "*-*-*     Here are our spicy tea options:     *-*-*".red
        scrape_spicy_teas
        input_options
      when "3"
        puts "*-*-*     Here are our floral tea options:     *-*-*".magenta
        scrape_floral_teas
        input_options
      when "exit"
        puts "Thanks for visiting. See you again soon!"
      when "menu"
        menu
      else
        puts "Sorry, that option is not valid. Please enter a number between 1 - 3, or type 'exit."
      end
    end
  end

  def scrape_fruity_teas
    url = "https://tealish.com/collections/fruity"
    @teas = Tealish::Scraper.scrape_teas(url)
    list_options
  end

  def scrape_spicy_teas
    url = "https://tealish.com/collections/spicy"
    @teas = Tealish::Scraper.scrape_teas(url)
    list_options
  end

  def scrape_floral_teas
    url = "https://tealish.com/collections/floral"
    @teas = Tealish::Scraper.scrape_teas(url)
    list_options
  end

  def input_options
    puts "\nEnter a number for more details, 'menu' to return to the flavor menu, or 'exit'."
  end

  def list_options
    @teas.each.with_index(1) do |tea, i|
      puts "#{i}. #{tea.name} - #{tea.type} - #{tea.price}"
      puts "https://tealish.com#{tea.url}"
    end
  end
end
