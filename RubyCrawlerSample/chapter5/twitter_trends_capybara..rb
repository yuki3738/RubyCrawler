# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'capybara-webkit'

Capybara.default_selector = :xpath
Capybara.default_driver = :selenium
Capybara.app_host = "https://twitter.com/search-home"

module Spider
	class Twitter
		include Capybara::DSL

		def search
			visit('')
			all("//ul[@class='trend-items js-trends']/li/a").each do |element|
				puts element.text
			end
		end

	end
end

spider = Spider::Twitter.new
spider.search