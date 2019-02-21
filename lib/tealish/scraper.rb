class Tealish::Scraper

  def self.scrape_teas(url)
     website = Nokogiri::HTML(open(url))
     @teas = []

     website.css("figcaption").each do |tea|
       new_tea = Tealish::Tea.new
       new_tea.name = tea.css("div.product-title a.title").children[0].text
       new_tea.type = tea.css("div.product-title a.title span").text
       new_tea.price = tea.css("span.price span.money").text
       new_tea.url = tea.css("a").attribute("href").text
       @teas << new_tea
     end
     @teas
   end

  #  def self.scrape_tea_details(tea)
  #    website = Nokogiri::HTML(open(tea.url))
  #    binding.pry
  #  end
end
