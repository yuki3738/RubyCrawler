# -*- coding: utf-8 -*-
require 'koala'

graph = Koala::Facebook::API.new('FACEBOOK_ACCESS_TOKEN')

# BRAVIAについて言及している発言を取得
search = graph.search('BRAVIA')
search.each {|result|
	puts result['message']
	# 発言主の情報を取得
	who = graph.get_object(result['from']['id'].to_s)
	puts "性別：" + who['gender'].to_s
	puts "生年月日：" + who['birthday'].to_s
}