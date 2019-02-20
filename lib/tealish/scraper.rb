class Tealish::Scraper

  def self.scrape_flavors(url)
    website = Nokogiri::HTML(open(url))
    nav = website.css("div.nav-container")

    flavor_name = nav.css("a").text
    binding.pry
  end

end
