# -*- coding: utf-8 -*-
require 'twitter'

config = {
	:consumer_key => 'TWITTER_API_KEY',
	:consumer_secret => 'TWITTER_API_SECRET',
	:access_token => 'TWITTER_ACCESS_TOKEN',
	:access_token_secret => 'TWITTER_ACCESS_TOKEN_SECRET'
}

client = Twitter::REST::Client.new(config)
client.user_timeline('dkfj').each {|tweet|
	# Tweet時間
	puts tweet.created_at

	# Tweet本文
	puts tweet.text

	# Retweet数
	puts "Retweetされた数 : " + tweet.retweet_count.to_s

	# お気に入りされた数
	puts "お気に入りされた数 : " + tweet.favorite_count.to_s

	# 位置情報
	puts "位置情報 : " + tweet.geo if !tweet.geo.nil?
}