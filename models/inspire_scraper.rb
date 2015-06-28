class Scraper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def scrape_random_quote
    html = open(self.url)
    doc = Nokogiri::HTML(html)
    quotes = doc.css("div.boxyPaddingBig")

    quotes.map do |quotes_new|
      author_content = quotes_new.css("a[title='view quote']").first.text
      author_name = quotes_new.css("a[title='view author']").first.text
      [author_content, author_name]
    end.sample
  end

  def scrape_random_image
    html = open("https://unsplash.com")
    doc = Nokogiri::HTML(html)
    rand_pic_url = doc.css("div.photo-container img").attr('href')
  end
end