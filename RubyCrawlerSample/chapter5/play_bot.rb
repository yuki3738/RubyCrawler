# -*- coding: utf-8 -*-
require 'market_bot'

# ゲームカテゴリの無料アプリのランキング取得
lb = MarketBot::Android::Leaderboard.new(:topselling_free, :game)
lb.update

lb.results.each {|result|
	app = MarketBot::Android::App.new(result[:market_id])
	app.update
	puts "#{app.title} price: #{app.price}"
}