# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'URI'

Capybara.current_driver = :selenium
Capybara.app_host = "http://www.yahoo.co.jp/"
Capybara.default_wait_time = 20

module Crawler
	class LinkChecker
		include Capybara::DSL

		def initialize()
			visit('')
		end

		def find_links
			@links = []
			all('a').each do |a|
				u = a[:href]
				next if u.nil? or u.empty?
				@links << u

				# 収集するリンクを10個までに抑える
				break if @links.size >= 10
			end

			@links.uniq!
			@links
		end

		def screenshot(link)
			puts link
			visit(link)
			page.save_screenshot("screenshot.png")
		end

	end
end

base = URI.parse(Capybara.app_host)
crawler = Crawler::LinkChecker.new
links = crawler.find_links
links.each {|link|
	if URI.parse(link).host == base.host then
		crawler.screenshot(link)
	end
}