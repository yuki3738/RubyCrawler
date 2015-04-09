# -*- coding: utf-8 -*-
require 'anemone'

urls = []
urls.push("http://www.yahoo.co.jp")

opts = {
	:storage => Anemone::Storage::MySQL(),
	:depth_limit => 0
}

Anemone.crawl(urls, opts) do |anemone|
	anemone.on_every_page do |page|
		puts page.url
		puts page.doc.xpath("//title/text()").to_s if page.doc
	end
end