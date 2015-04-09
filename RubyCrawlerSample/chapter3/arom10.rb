# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = 'http://b.hatena.ne.jp/dkfj/atomfeed'
xml = open(url).read

doc = Nokogiri::XML(xml)

namespaces = {
	# デフォルト名前空間
	"atom" => "http://purl.org/atom/ns#",
	"dc" => "http://purl.org/dc/elements/1.1/"
}

entries = doc.xpath('//atom:entry', namespaces)
entries.each {|entry|
	puts entry.xpath('atom:title', namespaces).text
}