# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'capybara/poltergeist'

Capybara.current_driver = :selenium
Capybara.app_host = "https://affiliate.amazon.co.jp/"
Capybara.default_wait_time = 5

module Crawler
	class Amazon
		include Capybara::DSL

		def login
			visit('')
			fill_in "username",
			:with => 'AMAZON_USER_ID'
			fill_in "password",
			:with => 'AMAZON_PASSWORD'
			click_button "サインイン"
		end

		def portal
			select('AMAZON_AFFILIATE_ID',
			:from => 'idbox_store_id')
			select('昨日', :from => 'preSelectedPeriod')
			first('.line-item-links')
			.click_link("レポート全体を表示")
		end

		def report
			within(:xpath, "//*[@class='totals']") do
				puts "発送済み商品:"+all('td')[1].text
				puts "売上:"+all('td')[2].text
				puts "紹介料:"+all('td')[3].text
			end
		end

	end
end

crawler = Crawler::Amazon.new
crawler.login
crawler.portal
crawler.report