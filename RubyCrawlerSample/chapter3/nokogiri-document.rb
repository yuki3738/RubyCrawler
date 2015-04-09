require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))
puts doc.class  	# => Nokogiri::HTML::Document
puts doc.title  	# => Yahoo! JAPAN
puts doc.encoding	# => utf-8

# Nodeのメソッドも利用可能
puts doc.xpath('//title')