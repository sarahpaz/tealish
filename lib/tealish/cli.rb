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
        url = "https://tealish.com/collections/fruity"
        tea_options = Tealish::Scraper.scrape_teas(url)
        tea_options.each_with_index do |tea, i|
          puts "#{i + 1}. #{tea.name} - #{tea.type} - #{tea.price}"
        end
        puts "\nEnter a number for more details, 'menu' to return to the flavor menu, or 'exit'."
      when "2"
        puts "*-*-*     Here are our spicy tea options:     *-*-*".red
        url = "https://tealish.com/collections/spicy"
        tea_options = Tealish::Scraper.scrape_teas(url)
        tea_options.each_with_index do |tea, i|
          puts "#{i + 1}. #{tea.name} - #{tea.type} - #{tea.price}"
        end
        puts "\nEnter a number for more details, 'menu' to return to the flavor menu, or 'exit'."
      when "3"
        puts "*-*-*     Here are our floral tea options:     *-*-*".magenta
        url = "https://tealish.com/collections/floral"
        tea_options = Tealish::Scraper.scrape_teas(url)
        tea_options.each_with_index do |tea, i|
          puts "#{i + 1}. #{tea.name} - #{tea.type} - #{tea.price}"
        end
        puts "\nEnter a number for more details, 'menu' to return to the flavor menu, or 'exit'."
      when "exit"
        puts "Thanks for visiting. See you again soon!"
      when "menu"
        menu
      else
        puts "Sorry, that option is not valid. Please enter a number between 1 - 3, or type 'exit."
      end
    end
  end

  def more_details
    puts ""
  end
end
