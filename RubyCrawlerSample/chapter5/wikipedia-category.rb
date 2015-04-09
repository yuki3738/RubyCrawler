# -*- coding: utf-8 -*-
require "nokogiri"
require "open-uri"

@base_url = "http://ja.wikipedia.org"
# 検索対象のカテゴリのURL
# 日本の映画作品_(ジャンル別)
category_url = "/wiki/Category:%E6%97%A5%E6%9C%AC%E3%81%AE%E6%98%A0%E7%94%BB%E4%BD%9C%E5%93%81_(%E3%82%B8%E3%83%A3%E3%83%B3%E3%83%AB%E5%88%A5)"

def category_search(url,depth)
	return if depth >= 4
	doc = Nokogiri::HTML(open(@base_url+url))
	doc.xpath("//div[@class='CategoryTreeItem']/a").each do |element|
		puts element.text
		puts element[:href]
		# 再帰的に取得
		category_search(element[:href],depth+1)
	end
end

category_search(category_url,1)