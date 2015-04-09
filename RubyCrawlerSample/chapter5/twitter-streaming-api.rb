# -*- coding: utf-8 -*-
require 'twitter'

config = {
	:consumer_key => 'TWITTER_API_KEY',
	:consumer_secret => 'TWITTER_API_SECRET',
	:access_token => 'TWITTER_ACCESS_TOKEN',
	:access_token_secret => 'TWITTER_ACCESS_TOKEN_SECRET'
}

client = Twitter::Streaming::Client.new(config)
client.sample do |tweet|
	if tweet.is_a?(Twitter::Tweet)
	# 日本語のつぶやきだけ表示
		puts tweet.text if tweet.lang == "ja"
	end
end