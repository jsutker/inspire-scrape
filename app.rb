require_relative 'config/environment'

class App < Sinatra::Base

  # this route is a GET request to our application.
  get '/inspire' do
    page_num = rand(1..40)
    page = page_num.to_s unless page_num == 1
    page ||= ""
    url = "http://www.brainyquote.com/quotes/topics/topic_positive#{page}.html"
    scraper = Scraper.new(url)
    @inspire = scraper.scrape_random_quote
    @image_url = scraper.scrape_random_image
    erb :inspire
  end
end

# this class is then run in config.ru