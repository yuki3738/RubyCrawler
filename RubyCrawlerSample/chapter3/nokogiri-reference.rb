# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

## Nodeの参照
# HTMLタグ含む
puts doc.at('//title').to_html
puts doc.at('//title').to_xhtml
puts doc.at('//title').to_xml
puts doc.at('//title').to_s

# HTMLタグで囲まれた文字列
puts doc.at('//title').text
puts doc.at('//title').inner_html
puts doc.at('//title').inner_text
puts doc.at('//title').to_str

# 属性値の取得
puts doc.at('//a').[]('href')
puts doc.at('//a').attribute('href')
puts doc.at('//a').get_attribute('href')

## NodeSetの参照
# HTMLタグ含む
puts doc.xpath('//title').to_html
puts doc.xpath('//title').to_xhtml
puts doc.xpath('//title').to_xml
puts doc.xpath('//title').to_s

# HTMLタグで囲まれた文字列
puts doc.xpath('//title').text
puts doc.xpath('//title').inner_html
puts doc.xpath('//title').inner_text