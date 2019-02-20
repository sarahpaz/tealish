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
      1. Flavour
      2. Benefit
      3. Mood
    DOC
  end

  def options
    input = nil
    while input != "exit"
      puts "\nEnter a number between 1 - 3 to select the category, or enter 'exit'."
      input = gets.strip
      case input
      when "1"
        puts "Flavor"
      when "2"
        puts "Benefit"
      when "3"
        puts "Mood"
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
