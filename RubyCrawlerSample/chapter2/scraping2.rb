# -*- coding: utf-8 -*-
require 'anemone'
require 'nokogiri'
require 'kconv'

urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466298/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/")

Anemone.crawl(urls, :depth_limit => 0) do |anemone|
	anemone.on_every_page do |page|

	#文字コードをUTF8に変換したうえで、Nokogiriでパース
	doc = Nokogiri::HTML.parse(page.body.toutf8)

	category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text

	#カテゴリ名の表示
	sub_category = doc.xpath("//*[@id=\"zg_listTitle\"]/span").text
	puts category+"/"+sub_category

	items = doc.xpath("//div[@class=\"zg_itemRow\"]/div[1]/div[2]")
	items += doc.xpath("//div[@class=\"zg_itemRow\"]/div[2]/div[2]")
	items.each{|item|

		# 順位
		puts item.xpath("div[1]/span[1]").text

		# 書名
		puts item.xpath("div[\"zg_title\"]/a").text

		# ASIN
		puts item.xpath("div[\"zg_title\"]/a")
			.attribute("href").text.match(%r{dp/(.+?)/})[1]
		}
	end
end