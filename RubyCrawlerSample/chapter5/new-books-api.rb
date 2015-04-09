# -*- coding: utf-8 -*-
require 'amazon/ecs'

Amazon::Ecs.options = {
	:associate_tag => 'sampleapp-22',
	:AWS_access_key_id => 'AWS_ACCESS_KEY',
	:AWS_secret_key => 'AWS_SECRET_ACCESS_KEY'
}

day = Time.now

power = "pubdate:during #{day.month}-#{day.year}"
res = Amazon::Ecs.send_request(
	{:operation => 'ItemSearch',:search_index => 'Books',:sort => 'daterank',:country => 'jp', :power => power })

res.items.each do |item|
	puts item.get('ASIN')
	puts item.get('ItemAttributes/Title')
end