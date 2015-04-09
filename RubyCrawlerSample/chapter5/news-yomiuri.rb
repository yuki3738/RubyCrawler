class Yomiuri
	attr_reader :base_url
	attr_reader :url

	def initialize()
		@base_url = "http://www.yomiuri.co.jp/latestnews/"
		@url = @base_url
	end

	def scrape(doc)
		titles={}
		reg_pattern = "//div[@class='pbNested row-contents']/div/div/ul/li/a"
		doc.xpath(reg_pattern).each {|element|
			url = element.text.gsub(/\r\n|\t|\s/,"")
			title = "#{element[:href]}"
			titles.store(url.to_s, title)
		}
		return titles
	end
end