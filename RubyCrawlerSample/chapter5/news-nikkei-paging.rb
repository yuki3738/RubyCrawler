def get_next_url(doc)
	next_url = nil
	element = doc.xpath("//li[@class='cmnc-next']/a")
	if !element.empty?
		next_url = "#{base_url}#{element.first[:href]}"
	end
		return next_url
end