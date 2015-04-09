# -*- coding: utf-8 -*-
require 'anemone'

urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/")
urls.push("http://news.yahoo.co.jp")

Anemone.crawl(urls, :depth_limit => 0) do |anemone|
	anemone.on_every_page do |page|
		puts page.doc.xpath("//title")
	end
end