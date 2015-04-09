# -*- coding: utf-8 -*-
require 'open-uri'
require 'nokogiri'
require './news-site.rb'
require './news-yomiuri.rb'

def get_nokogiri_doc(url)
	begin
		html = open(url)
	rescue OpenURI::HTTPError
		return
	end
	Nokogiri::HTML(html.read, nil, 'utf-8')
end

site = NewsSite.new(Yomiuri.new)
doc = get_nokogiri_doc(site.url)
titles = site.scrape(doc)
titles.each {|key,value|
	puts key
	puts value
}