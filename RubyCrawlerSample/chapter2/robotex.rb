require 'robotex'

robotex = Robotex.new "My User Agent Name Like WebCrawler"
p robotex.allowed?("http://www.yahoo.co.jp")
p robotex.allowed?("https://www.facebook.com/")