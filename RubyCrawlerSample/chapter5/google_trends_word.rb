# -*- coding: utf-8 -*-
require 'open-uri'
require 'nokogiri'

atom = open('http://www.google.co.jp/trends/hottrends/atom/hourly')
doc = Nokogiri::HTML(atom)
#puts doc

doc.xpath("/html/body/feed/entry/content/li/span/a").each {|element|
	puts element.text
	puts element[:href]
}