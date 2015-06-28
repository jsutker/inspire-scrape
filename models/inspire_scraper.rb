class Scraper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def scrape
    html = open(self.url)
    doc = Nokogiri::HTML(html)
    quotes = doc.css("div.boxyPaddingBig")

    quotes.each do |quotes_new|
      author_name = quotes_new.css("a[title=view quote]").first.text
      author_content = quotes_new.css("a[title=view author]").first.text
    end
  end
end