site = NewsSite.new(Nikkei.new)
url = site.url
loop {
	doc = get_nokogiri_doc(url)
	titles = site.scrape(doc)
	titles.each {|key,value|
		puts key
		puts value
	}
	url = site.get_next_url(doc)
	break if url.nil?
}