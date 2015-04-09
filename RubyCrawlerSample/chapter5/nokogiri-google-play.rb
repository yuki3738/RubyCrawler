# -*- coding: utf-8 -*-
require 'open-uri'
require 'nokogiri'

# ファイナンス・有償アプリ
url = 'https://play.google.com/store/apps/category/FINANCE/collection/topselling_paid'
doc = Nokogiri::HTML(open(url), nil, 'UTF-8')
doc.xpath("//h2/a[@class='title']").each{ |item|
	puts item[:title]
}