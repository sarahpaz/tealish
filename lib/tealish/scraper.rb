class Tealish::Scraper

  def self.scrape_tea(url)
    website = Nokogiri::HTML(open(url))
    teas = []

    website.css("figure").each do |tea|
      name = website.css("div.product-title a.title").text
      type = website.css("div.product-title a.title span").text
      price = website.css("span.price span.money").text

      item_detail = {name: name, type: type, price: price}

      teas << item_detail
    end

    teas
  end

end
