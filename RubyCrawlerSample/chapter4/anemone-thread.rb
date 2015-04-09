# -*- coding: utf-8 -*-
require 'anemone'

urls = []
urls.push(
	"http://www.amazon.co.jp/gp/bestsellers/books/466284/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/571582/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/492152/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466286/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/492054/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466290/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/492166/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466298/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466294/")

opts = {
	:obey_robots_txt => true,
	:threads => 10,
	:depth_limit => 0
}

Anemone.crawl(urls, opts) do |anemone|
	anemone.on_every_page do |page|
		puts page.url
		puts page.doc.xpath("//title/text()").to_s if page.doc
	end
end