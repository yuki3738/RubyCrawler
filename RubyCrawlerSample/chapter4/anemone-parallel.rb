# -*- coding: utf-8 -*-
require 'parallel'
require 'nokogiri'
require 'open-uri'

urls = []
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466284/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/571582/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/492152/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466286/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/492054/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466290/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/492166/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466298/")
	urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466294/")

Parallel.each(urls, in_threads: 10) {|url|
	doc = Nokogiri::HTML(open(url))
	puts doc.title
}