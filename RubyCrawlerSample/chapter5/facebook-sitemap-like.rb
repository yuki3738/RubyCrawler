# -*- coding: utf-8 -*-
require 'open-uri'
require 'rexml/document'
require 'json'

def get_xml_doc(url)
	return REXML::Document.new(open(url))
end

base_url="http://blog.takuros.net/sitemap.xml"
sitemaps = get_xml_doc(base_url)
sitemaps.elements.each('sitemapindex/sitemap/loc') do |element|

	sitemap = get_xml_doc(element.text)
	sitemap.elements.each('urlset/url/loc/')
		do |element|
		response = open("http://graph.facebook.com/#{element.text}").read
		json = JSON.parse(response)
		puts json['id'] # => URLの表示
		puts "いいね："+json['shares'].to_s if json.key?('shares')
	end
end