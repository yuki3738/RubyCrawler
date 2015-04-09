# -*- coding: utf-8 -*-
require 'twitter'

config = {
	:consumer_key => 'TWITTER_API_KEY',
	:consumer_secret => 'TWITTER_API_SECRET',
	:access_token => 'TWITTER_ACCESS_TOKEN',
	:access_token_secret => 'TWITTER_ACCESS_TOKEN_SECRET'
}

# 日本
place_id = 23424856
client = Twitter::REST::Client.new(config)
client.trends(place_id).each {|trend|
	puts trend.name
	puts trend.url
}