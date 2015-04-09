# -*- coding: utf-8 -*-
require 'twitter'

config = {
	:consumer_key => 'TWITTER_API_KEY',
	:consumer_secret => 'TWITTER_API_SECRET',
	:access_token => 'TWITTER_ACCESS_TOKEN',
	:access_token_secret => 'TWITTER_ACCESS_TOKEN_SECRET'
}

client = Twitter::REST::Client.new(config)
client.trends_available.each {|available|
	puts available.id
}