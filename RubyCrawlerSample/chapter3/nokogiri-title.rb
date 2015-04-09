# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))
nodesets = doc.xpath('//title')
puts nodesets.text      	# => Yahoo! JAPAN
puts nodesets.inner_text	# => Yahoo! JAPAN
puts nodesets.first.inner_text	# => Yahoo! JAPAN

nodesets.each{|nodeset|
	puts nodeset.content()	# => Yahoo! JAPAN
	puts nodeset.text	# => Yahoo! JAPAN
	puts nodeset.inner_text	# => Yahoo! JAPAN
}