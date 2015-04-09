# -*- coding: utf-8 -*-
require 'anemone'

urls = []
urls.push("http://www.yahoo.co.jp/")

opts = {
	:proxy_host => 'localhost',
	:proxy_port => '5432',
	:obey_robots_txt => true,
	:depth_limit => 0
}

Anemone.crawl(urls, opts) do |anemone|
	anemone.on_every_page do |page|
		puts page.doc.xpath("//title/text()").to_s if page.doc
	end
end