# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = 'http://www.amazon.co.jp/gp/rss/bestsellers/books/ref=zg_bs_books_rsslink'
xml = open(url).read

doc = Nokogiri::XML(xml)

items = doc.xpath('//rss/channel/item')
items.each { |item|
	#タイトルの表示
	puts item.xpath('title').text
}