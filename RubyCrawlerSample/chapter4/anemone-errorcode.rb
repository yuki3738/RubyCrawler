# -*- coding: utf-8 -*-
require 'anemone'

urls = []
urls.push("http://www.hatena.ne.jp/hogehogehoge")

opts = {
	:depth_limit => 1,
	:obey_robots_txt => true
}

Anemone.crawl(urls, opts) do |anemone|
	anemone.on_every_page do |page|
		puts page.url
		raise '500 Error!:' + page.url.path.to_s if page.code = 500
	end
	anemone.after_crawl do |pages|
		puts "hoge"
	end
end