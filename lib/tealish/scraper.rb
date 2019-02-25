class Tealish::Scraper
  def self.scrape_teas(flavor) 
    site = Nokogiri::HTML(open("https://tealish.com/collections/#{flavor}"))

    site.css("figcaption").each do |tea| 
      new_tea = Tealish::Teas.new(flavor)
      new_tea.name = tea.css("div.product-title a.title").children[0].text
      new_tea.type = tea.css("div.product-title a.title span").text
      new_tea.price = tea.css("span.price span.money").children[0].text
      new_tea.url = "https://tealish.com" + tea.css("a").attribute("href").text
      new_tea
    end
  end

  def self.scrape_tea_details(new_tea) 
      site = Nokogiri::HTML(open(new_tea.url))
      new_tea.description = site.css("div.productdesc").text.strip
      new_tea.ingredients = site.css("p.lower-txt").children[1].text.strip
  end
end
