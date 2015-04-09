page_source = open("samplepage.html", &:read)
dates = page_source.scan(%r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)
dates[0,4]

url_titles = page_source.scan(%r!^<a href="(.+?)">(.+?)</a><br />!)
url_titles[0,4]

dates.length
url_titles.length	
