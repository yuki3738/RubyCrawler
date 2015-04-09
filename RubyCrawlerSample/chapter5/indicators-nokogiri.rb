# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = 'http://info.finance.yahoo.co.jp/fx/marketcalendar/'
doc = Nokogiri::HTML(open(url))

doc.xpath("//div[@class='ecoEventTbl02 marB20']/table/tr").each {|element|
	puts "指標名：#{element.xpath(".//td[@class='event']").text}"
	puts "予想：#{element.xpath(".//td[@class='expectation']").text}"
	puts "結果：#{element.xpath(".//td[@class='result']").text}"
}