class Tealish::CLI
  def start
    puts "     _______ _      "
    puts "     \\      /_]    "
    puts "      \\___ /       "
    puts "Welcome to Tealish!"
    flavor_menu
    select_flavor
  end

  def flavor_menu
    puts "Please select a number from the flavor list below:"
    puts <<-DOC
      1. Fruity
      2. Spicy
      3. Floral
      4. Minty
    DOC
  end

  def select_flavor
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "fruity teas"
      when "2"
        puts "spicy teas"
      when "3"
        puts "floral teas"
      when "4"
        puts "minty teas"
      when "exit"
        puts "Thanks for visiting. See you again soon!"
      else
        puts "Sorry, that wasn't a valid option. Please enter a number between 1 - 4."
      end
    end
  end
end
