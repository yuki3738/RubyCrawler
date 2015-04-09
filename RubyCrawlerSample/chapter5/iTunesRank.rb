# -*- coding: utf-8 -*-
require 'open-uri'

Categories = %w(6021 6016 6022 6017 6014 6007 6006 6008 6004 6005 6001 6010 6009 6000 6015 6018 6013 6011 6020 6002 6012 6003 36)
PopIdes = %w(27 30 38 44 47 46)
BASE_URL = 'https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?'
USER_AGENT = "iTunes/11.2.1 (Macintosh; OS X 10.9.2)AppleWebKit/537.74.9\r\n"
STORE = '143462-9'

def getUrl(category,popId)
	return BASE_URL+"genreId="+category+"&popId="+popId
end

def getRanks(url)
	i = 0
	open(url, "User-Agent" => USER_AGENT, "X-Apple-Store-Front" => STORE) do |f|
		f.each do |line|
			next if !line.match(/Buy.*salableAdamId=(\d+)/)
			i += 1
			line.match(/itemName="([^"]+)"/)
			puts i.to_s + ": " + $1
		end
	end
end

# main
Categories.each {|category|
	PopIdes.each {|popId|
		puts "category=#{category}, popID=#{popId}"
		url = getUrl(category,popId)
		getRanks(url)
	}
}