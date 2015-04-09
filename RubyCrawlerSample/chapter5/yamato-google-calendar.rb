# -*- coding: utf-8 -*-
require 'nokogiri'
require 'net/http'
require 'google_calendar'

#コマンドライン引数から問い合わせ番号の取得
if ARGV.size == 1
	number = ARGV[0]
else
	puts "Input slip number"
	exit 1
end

def set_google_calendar(number,status,day)
	cal = Google::Calendar.new(
		:username => 'GOOGLE_ID',
		:password => 'GOOGLE_PASS',
		:app_name => 'mycompany.com-googlecalendar-integration')
	today = Time.now
	day_of_month = day.split(/\//)[1]
	month = day.split(/\//)[0]
	date = Time.local(today.year, month, day_of_month, 12, 00, 00)
	event = cal.create_event do |e|
		e.title = "ヤマト配送:#{number}/#{status}"
		e.start_time = date
		e.end_time = date
	end

	# イベントの登録
	puts event
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
	set_google_calendar(number,status,day)
}