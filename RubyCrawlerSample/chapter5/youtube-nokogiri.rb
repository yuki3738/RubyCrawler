# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'uri'

urls = []
search_term = URI.encode("新幹線")

url = "http://www.youtube.com/results?search_query=#{search_term}"

doc = Nokogiri::HTML(open (url))
elements= doc.xpath("//h3[@class='yt-lockup-title']/a")
elements.each do |a|
	code = a.attributes['href'].value
	urls << "http://www.youtube.com" + code if code.include?('watch')
end

urls.each {|url|
	puts url
	doc = Nokogiri::HTML(open(url), nil,"UTF-8")
	title = doc.xpath("//h1['watch-headline-title']/span").text.gsub(/\n/,'')
	description = doc.xpath("//p[@id='eow-description']").text
	puts title
	puts description
}