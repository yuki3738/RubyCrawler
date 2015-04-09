# -*- coding: utf-8 -*-
require 'anemone'
require 'open-uri'

urls = ["http://blog.livedoor.jp/staff/"]

opts = {
	:depth_limit => false,
	:delay => 1
}

Anemone.crawl(urls, opts) do |anemone|
	anemone.focus_crawl do |page|
		page.links.keep_if { |link|
			link.to_s.match(/blog.livedoor.jp\/staff\/archives\/(\d+)\.html/)
		}
		end
	anemone.on_every_page do |page|
		# 処理対象とするURLの表示
		puts page.url
	end
end