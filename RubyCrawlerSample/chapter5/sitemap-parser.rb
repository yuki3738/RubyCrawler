# -*- coding: utf-8 -*-
require 'open-uri'
require 'rexml/document'

def get_xml_doc(url)
	return REXML::Document.new(open(url))
end

base_url="http://blog.takuros.net/sitemap.xml"
base_url="http://blog.livedoor.jp/staff/sitemap.xml"

sitemaps = get_xml_doc(base_url)
	sitemaps.elements.each('sitemapindex/sitemap/loc')do |element|
	sitemap = get_xml_doc(element.text)
	sitemap.elements.each('urlset/url/loc/')do |element|
		if /\/staff\/archives\/(\d+)\.html/ =~ element.text
			# 巡回対象とするURLの表示
			puts element.text
		end
	end
end