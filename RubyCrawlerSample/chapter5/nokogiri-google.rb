# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'cgi'

escaped_url = URI.escape("https://www.google.com/search?q=クローラー&oe=utf-8&hl=ja")
doc = Nokogiri::HTML(open(escaped_url))

# 検索結果の数
puts doc.xpath("//*[@id='resultStats']/text()")
doc.xpath('//h3/a').each do |link|
	puts CGI.parse(link[:href])["adurl"]
	puts link.content
end