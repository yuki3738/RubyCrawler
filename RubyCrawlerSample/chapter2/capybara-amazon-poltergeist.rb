# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.configure do |config|
	config.run_server = false
	config.current_driver = :poltergeist
	config.javascript_driver = :poltergeist
	config.app_host = "https://affiliate.amazon.co.jp/"
	config.default_wait_time = 5
end

Capybara.register_driver :poltergeist do |app|
	Capybara::Poltergeist::Driver.new(app, {:timeout=>120, js_errors: false})
end

module Crawler
	class Amazon
		include Capybara::DSL

	def login
		puts "login start"
		page.driver.headers = { "User-Agent" => "Mac Safari" }
		visit('')
		fill_in "username", :with => 'AMAZON_USER_ID'
		fill_in "password", :with => 'AMAZON_PASSWORD'
		click_button "サインイン"
	end

	def portal
		wait_for_ajax
		select('AMAZON_AFFILIATE_ID',
		:from => 'idbox_store_id')
		page.execute_script("this.form.submit()")
		wait_for_ajax
		select('昨日', :from => 'preSelectedPeriod')
		page.execute_script("this.form.submit()")
		wait_for_ajax
		page.save_screenshot('screenshot2.png', :full => true)
		first('.line-item-links')
		.click_link("レポート全体を表示")
	end

	def report
		page.save_screenshot('screenshot3.png', :full => true)
		within(:xpath, "//*[@class='totals']") do
			puts "発送済み商品:"+all('td')[1].text
			puts "売上:"+all('td')[2].text
			puts "紹介料:"+all('td')[3].text
		end
	end

	def wait_for_ajax
		sleep 2
		Timeout.timeout(Capybara.default_wait_time) do
			active = page.evaluate_script('jQuery.active')
			until active == 0
				sleep 1
				active = page.evaluate_script('jQuery.active')
				end
			end
		end

	end
end

crawler = Crawler::Amazon.new
crawler.login
crawler.portal
crawler.report