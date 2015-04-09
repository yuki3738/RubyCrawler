urls = []
urls.push("http://www.youtube.com/watch?v=HhClT9cqK8E")
urls.push("http://www.youtube.com/watch?v=-MfeittF-qI")

urls.each {|url|
	puts url
	system("youtube-dl -t #{url}")
}