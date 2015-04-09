# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url="http://www.mof.go.jp/jgbs/reference/interest_rate/jgbcm.htm"
reg_pattern="//*[@id='index']/tbody/tr/td/ul/table[3]/tbody/tr"
doc = Nokogiri::HTML(open(url))
elements = doc.xpath(reg_pattern).last
array=[]
elements.xpath("td").each {|element|
	array.push element.text
}

puts "基準日：#{array[0]}"
puts "1年：#{array[1]}"
puts "2年：#{array[2]}"
puts "3年：#{array[3]}"
puts "4年：#{array[4]}"
puts "5年：#{array[5]}"
puts "6年：#{array[6]}"
puts "7年：#{array[7]}"
puts "8年：#{array[8]}"
puts "9年：#{array[9]}"
puts "10年：#{array[10]}"
puts "15年：#{array[11]}"
puts "20年：#{array[12]}"
puts "25年：#{array[13]}"
puts "30年：#{array[14]}"
puts "40年：#{array[15]}"