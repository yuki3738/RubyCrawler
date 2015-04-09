# -*- coding: utf-8 -*-
require 'amazon/ecs'
require 'pp'

Amazon::Ecs.options = {
	:associate_tag => 'ASSOCIATE_TAG'
	:AWS_access_key_id => 'AWS_ACCESS_KEY'
	:AWS_secret_key => 'AWS_SECRET_ACCESS_KEY'
}

# 商品検索
opts = {
	:country => 'jp',
	:author => '北方謙三'
}

res = Amazon::Ecs.item_search('三国志', opts)
res.items.each do |item|
	puts item.get('ItemAttributes/Title')
end

# 個別商品の詳細表示
res = Amazon::Ecs.item_lookup('B00JXEFT6Y', :response_group => 'Small,ItemAttributes, Images', :country => 'jp')
pp res