# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'robotex'

Capybara.configure do |config|
	config.run_server = false
	config.current_driver = :poltergeist
	config.javascript_driver = :poltergeist
	config.app_host = "http://www.yahoo.co.jp/"
	config.default_wait_time = 5
	config.automatic_reload = false
end

Capybara.register_driver :poltergeist do |app|
Capybara::Poltergeist::Driver.new(app, {
	:timeout=>120, js_errors: false})
end

module Crawler
	class LinkChecker
		include Capybara::DSL
		def initialize()
			visit('')
			@robots = Robotex.new("Poltergeist")
		end

		def find_links
			@links = []
			all('a').each do |a|
				u = a[:href]
				next if u.nil? or u.empty?
				@links << u
			end
		@links.uniq!
		@links
		end

		def allowed?(link)
			@robots.allowed?(link)
		rescue
			false
		end

		def screenshot(link)
			puts link
			visit(link)
			page.save_screenshot("screenshot.png")
		end
	end
end

crawler = Crawler::LinkChecker.new
links = crawler.find_links
links.each {|link|
	if crawler.allowed?(link) then
		crawler.screenshot(link)
	end
}