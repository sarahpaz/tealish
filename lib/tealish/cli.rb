class Tealish::CLI
  def start
    greeting
    menu
    options
  end

  def greeting
    puts "     _______ _      ".cyan
    puts "     \\      /_]    ".cyan
    puts "      \\___ /       ".cyan
    puts "Welcome to Tealish!"
    puts "Which flavor would you like to shop by today?"
  end

  def menu
    puts "\nPlease enter a number between 1-3 to view the flavors tea collection."
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
        list_options
        choose_tea
      when "2"
        puts "*-*-*     Here are our spicy tea options:     *-*-*".red
        scrape_spicy_teas
        list_options
      when "3"
        puts "*-*-*     Here are our floral tea options:     *-*-*".magenta
        scrape_floral_teas
        list_options
      when "exit"
        puts "Thank you for visiting Tealish! We hope to see you again soon!"
      when "menu"
        menu
      else
        puts "Sorry, that option is not valid."
        menu
      end
    end
  end

  def scrape_fruity_teas
    url = "https://tealish.com/collections/fruity"
    @teas = Tealish::Scraper.scrape_teas(url)
  end

  def scrape_spicy_teas
    url = "https://tealish.com/collections/spicy"
    @teas = Tealish::Scraper.scrape_teas(url)
  end

  def scrape_floral_teas
    url = "https://tealish.com/collections/floral"
    @teas = Tealish::Scraper.scrape_teas(url)
  end

  def list_options
    @teas.each.with_index(1) do |tea, i|
      puts "#{i}. #{tea.name} - #{tea.type} - #{tea.price}"
      puts "https://tealish.com#{tea.url}"
    end
  end

  def choose_tea
    puts "\nEnter a number to select a tea:"
    input = gets.strip.to_i
    if input.between?(1, @teas.length)
      puts "valid option"
      choose_tea
    else
      puts "\nSorry, that option is not valid."
      choose_tea
      options
    end
  end
end
