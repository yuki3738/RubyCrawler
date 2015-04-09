# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'capybara-webkit'

Capybara.default_selector = :xpath
Capybara.default_driver = :selenium
Capybara.app_host = "http://www.contract.reins.or.jp/search/displayAreaConditionBLogic.do"

module Spider
	class Reins
		include Capybara::DSL
		def initialize()
			@pages = []
			@current_page = 0
		end

		def crawle
			visit('')

			# 地域を選択する
			select('大阪府', :from => 'prefCodeA')
			select('大阪市北部', :from => 'areaCodeA')
			click_on('検索する')

			# OKボタン
			page.driver.browser.switch_to.alert.accept

			# ページ番号の取得
			get_pages

			# ページごとに全データを取得する
			for i in 1..@pages.size-1
				scrape
				page_change(i)
			end
		end

		def scrape
			all("//*[@id='data05']/div[2]/table/tbody/tr").each {|element|
				if element.text !~ /^△沿線/
					# 物件情報の表示
					puts element.text
				end
			}
		end

		def get_pages
			all("//*[@id='data05']/div[1]/select/option").each {|element|
				@pages.push(element.text)
			}
		end

		def page_change(page_no)
			select(@pages[page_no], :from => 'listPageNum')
		end
	end
end

spider = Spider::Reins.new
spider.crawle