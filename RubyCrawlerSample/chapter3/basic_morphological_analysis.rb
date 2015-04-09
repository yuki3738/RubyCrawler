# -*- coding: utf-8 -*-
require 'open-uri'
require 'rexml/document'

APPLICATION_ID = 'YAHOO_API_KEY'
BASE_URL = 'http://jlp.yahooapis.jp/MAService/V1/parse'

def request(text)
	app_id = APPLICATION_ID
	params = "?appid=#{app_id}&results=uniq&filter=9&uniq_filter=9"
	url = "#{BASE_URL}#{params}"+"&sentence="+URI.encode("#{text}")
	response = open(url)
	doc = REXML::Document.new(response).elements[
		'ResultSet/uniq_result/word_list/']
		doc.elements.each('word') {|element|
		text = element.elements["surface"][0]
		count = element.elements["count"][0]
		p "#{text}=#{count}"
	}
end

text = "隣の客はよく柿食う客だ"
request(text)