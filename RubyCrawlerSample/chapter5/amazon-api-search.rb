# -*- coding: utf-8 -*-
require 'amazon/ecs'

Amazon::Ecs.options = {
	:associate_tag => 'sampleapp-22',
	:AWS_access_key_id => 'AWS_ACCESS_KEY'
	:AWS_secret_key => 'AWS_SECRET_ACCESS_KEY'
}

# 商品検索
res = Amazon::Ecs.item_search('クローラー', :search_index => 'Books', :country => 'jp')
res.items.each do |item|
	puts item.get('ASIN')
end