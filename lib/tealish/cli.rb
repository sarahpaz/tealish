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
      when 2
        puts "Fruity teas"
      when 3
        puts "Fruity teas"
      when 4
        puts "Fruity teas"
      when "exit"
        puts "Thanks for visiting. See you again soon!"
      else
        puts "Sorry, that wasn't a valid option. Please enter a number between 1 - 4."
        # they didn't pyt in a correct input
    end
  end
end
