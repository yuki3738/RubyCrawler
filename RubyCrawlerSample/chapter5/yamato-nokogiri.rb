# -*- coding: utf-8 -*-
require 'nokogiri'
require 'net/http'

# コマンドライン引数から問い合わせ番号の取得
if ARGV.size == 1
	number = ARGV[0]
else
	puts "Input slip number"
	exit 1
end

Net::HTTP.version_1_2

url = "toi.kuronekoyamato.co.jp"
html = nil
Net::HTTP.start(url, 80) {|http|
	response = http.post('/cgi-bin/tneko',"number01=#{number}")
	html = response.body
}
if html.nil?
	exit
else
	html.encode!("UTF-8", "Shift_JIS")
end

doc = Nokogiri::HTML(html) if !html.nil?
doc.xpath("//table[@class='ichiran']/tr[3]").each {|element|
	day = element.xpath(".//*[@class='hiduke']/font").text
	status = element.xpath(".//*[@class='ct']/font").text
	puts day
	puts status
}