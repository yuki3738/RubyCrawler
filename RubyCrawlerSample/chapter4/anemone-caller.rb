# -*- coding: utf-8 -*-
require 'anemone'
require 'pp'

urls = []
urls.push("http://www.yahoo.co.jp")

opts = {
	:depth_limit => 0
}

Anemone.crawl(urls, opts) do |anemone|
	# 呼び出し元の情報をスタックトレースで表示
	pp caller()
	anemone.on_every_page do |page|
		puts page.url
		puts page.doc.xpath("//title/text()").to_s if page.doc
	end
end