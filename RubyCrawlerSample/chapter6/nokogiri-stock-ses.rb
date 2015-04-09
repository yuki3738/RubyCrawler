# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

class CompanyInfo
	def initialize(ticker_code)
		@baseUrl = "http://stocks.finance.yahoo.co.jp/stocks"
		@tickerCode = ticker_code
		scrape
	end
	attr_reader :name, :tickerCode, :category,
		:unit, :recentHighPrice, :recentLowPrice,
		:highPrice, :lowPrice, :price, :day

	private
	def scrape_stock_info(html, index)
		get_content(html, "dd", "ymuiEditLink mar0",
		index, "/strong").delete(",")
	end

	def get_company_info()
		url = "#{@baseUrl}/profile/?code=#{@tickerCode}"
		doc = get_nokogiri_doc(url)
		@name = doc.xpath("//th[@class='symbol']/h1").text
		@category = doc.xpath("//table[@class='boardFinCom marB6']/tr[6]/td").text
		@unit = doc.xpath("//table[@class='boardFinCom marB6']/tr[13]/td").text
	end

	def get_stock_info()
		url = "#{@baseUrl}/detail/?code=#{@tickerCode}"
		doc = get_nokogiri_doc(url)
		@recentHighPrice = doc.xpath("//div[11]/dl/dd[@class='ymuiEditLink mar0']/strong").text
		@recentLowPrice = doc.xpath("//div[12]/dl/dd[@class='ymuiEditLink mar0']/strong").text
		@highPrice = doc.xpath("//div[@class='innerDate']/div[3]/dl/dd[@class='ymuiEditLink mar0']/strong").text
		@lowPrice = doc.xpath("//div[@class='innerDate']/div[4]/dl/dd[@class='ymuiEditLink mar0']/strong").text
		@price = doc.xpath("//td[@class='stoksPrice']").text
		date=Time.now
		day_str=doc.xpath("//dd[@class='yjSb real']/span").text
		@day = "#{date.year}/#{day_str}"
	end

	def get_nokogiri_doc(url)
		begin
			html = open(url)
		rescue OpenURI::HTTPError
			return
		end
		Nokogiri::HTML(html.read, nil, 'utf-8')
	end

	def scrape
		get_company_info
		get_stock_info
	end
end

company = CompanyInfo.new("4689")
puts company.name
puts company.category
puts company.unit
puts "日付："+company.day
puts "年初来高値："+company.recentHighPrice
puts "年初来安値："+company.recentLowPrice
puts "高値："+company.highPrice
puts "安値："+company.lowPrice
puts "株価："+company.price

require 'aws-sdk'

ses = AWS::SimpleEmailService.new(
	:access_key_id => 'AWS_SES_KEY',
	:secret_access_key => 'AWS_SES_SECRET'
)
mail_body = <<"EOS"
	#{company.name}
	#{company.category}
	#{company.unit}
	年初来高値：#{company.recentHighPrice}
	年初来安値：#{company.recentLowPrice}
	高値：#{company.highPrice}
	安値：#{company.lowPrice}
	株価：#{company.price}
EOS

ses.send_email(
	:subject => "株価情報#{company.day}",
	:from => 'mail@example.com',
	:to => 'mail@example.com',
	:body_text => mail_body
)