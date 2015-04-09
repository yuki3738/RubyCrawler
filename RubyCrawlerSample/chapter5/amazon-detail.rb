# -*- coding: utf-8 -*-
require 'open-uri'
require 'nokogiri'

asin = "4873111870"
url="http://www.amazon.co.jp/dp/#{asin}"
doc = Nokogiri::HTML(open(url))

# 書籍名
puts doc.xpath("//span[@id='btAsinTitle']").text

# 価格
puts doc.xpath("//span[@id='actualPriceValue']/b").text

# 画像イメージのURL
puts doc.xpath("//img[@id='prodImage']").attribute("src").text