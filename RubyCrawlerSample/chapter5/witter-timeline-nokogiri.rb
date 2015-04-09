# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri.HTML(open('https://twitter.com/TwitterJP'))
doc.xpath("//div[@data-component-term='tweet']").each { |tweet|
	# Tweet時間
	puts Time.at(tweet.xpath(".//a[@class='ProfileTweet-timestamp js-permalink js-navjs-tooltip']/span").first['data-time'].to_i)

	# Tweet本文
	puts tweet.xpath(".//p[@class='ProfileTweet-text js-tweet-text u-dir']").text

	# Retweet数
	retweet = tweet.xpath(".//li[@class='ProfileTweet-action ProfileTweet-action--retweet js-toggle-state js-toggle-rt']/button[@class=
'ProfileTweet-actionCount js-actionCount js-tooltip']")

	if !retweet.empty?
		puts "Retweetされた数 : " + retweet[0]['data-tweet-stat-count']
	end

	# お気に入りされた数
	like = tweet.xpath(".//li[@class='ProfileTweet-action ProfileTweet-action--favorite js-toggle-state']/button[@class='ProfileTweet-actionCount js-actionCount js-tooltip']")

	if !like.empty?
		puts "お気に入りされた数 : " + like[0]['data-tweet-stat-count']
	end
}