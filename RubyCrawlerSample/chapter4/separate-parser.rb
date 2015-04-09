# -*- coding: utf-8 -*-
require 'anemone'

def crawl(url)
	Anemone.crawl(
		url, :depth_limit => 0) do | anemone |
			anemone.on_every_page do |page|
			parser(page)
		end
	end
end

def parser(page)
	puts page.doc.xpath("//title/text()")
end

url = "http://www.yahoo.co.jp/"
crawl(url)