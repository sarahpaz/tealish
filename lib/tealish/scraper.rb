class Tealish::Scraper
  attr_accessor

  def self.scrape_teas(url)
    website = Nokogiri::HTML(open(url))
    tea_options = []

    website.css("figure").each do |tea|
      tea_name = tea.css("div.product-title").text
      tea_type = tea.css("div.product-title span").text
      tea_price = tea.css('span.money').text

      tea_options << {tea_name: tea_name, tea_type: tea_type, tea_price: tea_price}
    end
    tea_options
  end

end
