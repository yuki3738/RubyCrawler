# -*- coding: utf-8 -*-
require 'open-uri'
require 'csv'

url="http://www.mof.go.jp/jgbs/reference/interest_rate/jgbcm.csv"
csv = open(url)
csv_obj = CSV.new(open(url), {
	:encoding => "Shift_JIS", :headers => :first_row})
csv_obj.each do |row|
	# 最終行のみ表示
	if csv_obj.eof?
		# puts row
		puts "基準日：#{row[0]}"
		puts "1年：#{row[1]}"
		puts "2年：#{row[2]}"
		puts "3年：#{row[3]}"
		puts "4年：#{row[4]}"
		puts "5年：#{row[5]}"
		puts "6年：#{row[6]}"
		puts "7年：#{row[7]}"
		puts "8年：#{row[8]}"
		puts "9年：#{row[9]}"
		puts "10年：#{row[10]}"
		puts "15年：#{row[11]}"
		puts "20年：#{row[12]}"
		puts "25年：#{row[13]}"
		puts "30年：#{row[14]}"
		puts "40年：#{row[15]}"
	end
end