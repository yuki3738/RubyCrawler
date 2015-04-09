# -*- coding: utf-8 -*-
require 'amazon/ecs'

Amazon::Ecs.options = {
	:associate_tag => 'sampleapp-22',
	:AWS_access_key_id => 'AWS_ACCESS_KEY',
	:AWS_secret_key => 'AWS_SECRET_ACCESS_KEY'
}

# 商品検索
res = Amazon::Ecs.item_lookup('4873111870', :response_group => 'Small, ItemAttributes, Images', :country => 'jp')

# 書籍名
puts res.items.first.get("ItemAttributes/Title")

# 価格
puts res.items.first.get("//FormattedPrice")

# 画像イメージのURL
puts res.items.first.get("MediumImage/URL")