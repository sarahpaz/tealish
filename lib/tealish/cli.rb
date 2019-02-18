class Tealish::CLI
  def start
    puts "     _______ _      "
    puts "     \\      /_]    "
    puts "      \\___ /       "
    puts "Welcome to Tealish!"
    sleep(1)
    puts "\nWhich flavor collection would you like to view?"
    puts "Please select a number from the list below:"
    puts <<-DOC
      1. Fruity
      2. Spicy
      3. Floral
      4. Minty
    DOC
    flavor_option = gets.to_i
    case flavor_option
      when 1
        puts "Fruity teas"
        url = "https://tealish.com/collections/fruity"
        Tealish::Scraper.scrape_flavors(url)
      when 2
        puts "Spicy teas"
      when 3
        puts "Floral teas"
      when 4
        puts "Minty teas"
      when "exit"
        puts "Thanks for visiting. See you again soon!"
      else
        puts "Sorry, that wasn't a valid option. Please enter a number between 1 - 4."
    end
  end
end
