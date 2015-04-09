# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

puts doc%'//title'
puts doc/'//title'
puts doc.at('//title')
# => 検索にヒットした最初のノード

puts doc.at_xpath('//title')
# => xpathの検索にヒットした最初のノード

puts doc.at_css('title')
# => cssの検索にヒットした最初のノード

puts doc.css('title')
# => cssで検索。NodeSet

puts doc.css('title')[0]
# => cssで検索。NodeSetから最初のノード

puts doc.search('title')
# => xpathかcssで検索。NodeSet

puts doc.search('title')[0]
#=> xpathかcssで検索。NodeSetから最初のノード

puts doc.xpath('//title')
# => xpathで検索。NodeSet

puts doc.xpath('//title')[0]
# => xpathで検索。NodeSetから最初のノード

puts doc.xpath('//title').first
# => xpathで検索。NodeSetから最初のノード