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
    puts "\nEnter a number to view the flavor collection:"
    puts "1. Fruity".cyan
    puts "2. Spicy".red
    puts "3. Floral".magenta
  end

  def options
    input = nil
    while input != "exit"
      input = gets.strip
      case input
      when "1"
        puts "*-*-*     Here are our fruity tea options:     *-*-*".cyan
        scrape_fruity_teas
        list_tea_options
        select_a_tea
      when "2"
        puts "*-*-*     Here are our spicy tea options:     *-*-*".red
        scrape_spicy_teas
        list_tea_options
        select_a_tea
      when "3"
        puts "*-*-*     Here are our floral tea options:     *-*-*".magenta
        scrape_floral_teas
        list_tea_options
        select_a_tea
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

  def list_tea_options
    @teas.each.with_index(1) do |tea, index|
      puts "#{index}. #{tea.name} - #{tea.type} - #{tea.price}"
      puts "https://tealish.com#{tea.url}"
    end
  end

  def select_a_tea
    puts "\nEnter a number to select a tea:"
    input = gets.strip.to_i
    if input.between?(1, @teas.length)
      selected_tea = @teas[input - 1]
      puts "#{selected_tea.name} - #{selected_tea.type} - #{selected_tea.price}".green
      puts "https://tealish.com#{selected_tea.url}"
      #description
      # scrape_tea_details(selected_tea)
      # binding.pry
      puts "\nDESCRIPTION:".green
      puts"Drinking tea equals instant relaxation. Seriously, take a moment for yourself to make a cup, you’ll see how it relieves tension and refreshes your spirit. This wellness tea contains tulsi, an ancient herb that helps reduce stress and instil a sense of inner peace and calm. So drink up and feel your stress melt away."
      #ingredients
      puts "\nINGREDIENTS:".green
      puts "tulsi herb, apple bits, pear bits, red currants, ginger, rooibos, cinnamon, sunflower blossoms, natural flavouring, pineapple bits."
      menu
    else
      puts "\nSorry, that option is not valid."
      choose_tea
      options
    end
  end

  def scrape_tea_details(selected_tea)
    url = "https://tealish.com#{selected_tea.url}"
    Tealish::Scraper.scrape_tea_details(selected_tea)
    puts "hello"
    binding.pry
  end
end
