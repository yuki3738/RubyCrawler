# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

# 検索期間 => 過去30日
search_term="82837051"

# 検索カテゴリ => 歴史・地理
category="466286"
base_url = "http://www.amazon.co.jp/s/?rh=n%3A465392%2Cp_n_binding_browse-bin%3A86137051%2Cn%3A%21465610%2C"
url="#{base_url}n%3A#{category}%2Cp_n_publication_date%3A#{search_term}"

def get_next_url(doc)
	url = nil
	element = doc.xpath("//a[@id='pagnNextLink']")
	if !element.empty?
		url = "http://www.amazon.co.jp/#{element.first[:href]}"
	end
	return url
end

loop {
	doc = Nokogiri::HTML(open(url))
	doc.xpath("//div[@id='atfResults']/div/h3/a").each {|element|
		puts element[:href]
		puts element.text
	}
	url = get_next_url(doc)
	break if url.nil?
}