# -*- coding: utf-8 -*-
require 'anemone'

Anemone.crawl("http://www.yahoo.co.jp") do |anemone|
	# adminを含むURLは除外
	anemone.skip_links_like /\/r\//
	anemone.on_every_page do |page|
		puts page.url
	end
end