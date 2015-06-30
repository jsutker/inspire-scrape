doc = Nokogiri::HTML(open("https://unsplash.com"))
rand_pic_container = doc.css("div.photo")
rand_pic_container = rand_pic_container[rand(0...rand_pic_container.length)]
rand_pic_url = rand_pic_container.css("img").first['src']