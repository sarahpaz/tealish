class Tealish::Scraper

  def self.scrape_tea(url)
    website = Nokogiri::HTML(open(url))
    tea = []

    website.css("figcaption") do |tea|
      name = tea.css("a.title").text
      type = tea.css("a.title span").text
      price = tea.css("span.price span.money").text
      url = tea.css("a.title").attribute("href").value

      tea_details << {name: name, type: type, price: price, url: url}

      tea << tea_details
    end
    tea
  end

end
