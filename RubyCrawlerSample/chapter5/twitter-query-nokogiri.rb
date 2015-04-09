# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri.HTML(open('https://twitter.com/search?f=realtime&q=%E3%82%AF%E3%83%AD%E3%83%BC%E3%83%A9%E3%83%BC&src=typd'))
doc.xpath("//li[@data-item-type='tweet']").each { |tweet|
	# Tweet時間
	puts Time.at(tweet.xpath(".//a[@class='tweet-timestamp js-permalink js-nav js-tooltip']/span").first['data-time'].to_i)
	# Tweet本文
	puts tweet.xpath(".//p[@class='js-tweet-text tweet-text']").text
}