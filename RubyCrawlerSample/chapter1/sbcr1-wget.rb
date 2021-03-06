# -*- coding: utf-8 -*-
require 'cgi'

def parse(page_source)
	dates = page_source.scan(%r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)
	url_titles = page_source.scan(%r!^<a href="(.+?)">(.+?)</a><br />!)
	url_titles.zip(dates).map{|(aurl, atitle),
		ymd|[CGI.unescapeHTML(aurl), CGI.unescapeHTML(atitle),
		Time.local(*ymd)]
	}
end
x = parse(`/usr/bin/wget -q -O- http://crawler.sbcr.jp/samplepage.html`)
x[0,2]
#     "最強の布陣で挑む！ GA文庫電子版
#     【俺TUEEEEE】キャンペーン開催中",
#      2014-02-21 00:00:00 +0900],
#    ["http://www.sbcr.jp/topics/11712/",
#     "【新刊情報】2014年2月17日～23日　
#     「コンセプト」の作り方がわかるビジネス書など12点",
#     2014-02-20 00:00:00 +0900]]