page_source = open("samplepage.html", &:read)
dates = page_source.scan(%r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)
dates[0,4]
# => [["2014", "2", "21"],
#     ["2014", "2", "20"],
#     ["2014", "2", "14"],
#     ["2014", "2", "12"]]
url_titles = page_source.scan(%r!^<a href="(.+?)">(.+?)</a><br />!)
url_titles[0,4]
# => [["http://www.sbcr.jp/topics/11719/",
#     "最強の布陣で挑む！ GA文庫電子版【俺TUEEEEE】
#      キャンペーン開催中"],
#    ["http://www.sbcr.jp/topics/11712/",
#     "【新刊情報】2014年2月17日 23日　
#     「コンセプト」の作り方がわかるビジネス書など12点"],
#    ["http://www.sbcr.jp/topics/11710/",
#     "『数学ガール』電子書籍版がAmazon Kindleで配信開始！
#      キャンペーンも同時開催！！"],
#    ["http://www.sbcr.jp/topics/11703/",
#     "【新刊情報】2014年2月10日 16日　
#      アニメ化決定『ワルブレ』最新刊など11点"]]
#      datesとurl_titlesの個数が一致している
dates.length     	# => 68
url_titles.length	# => 68