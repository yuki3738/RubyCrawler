# -*- coding: utf-8 -*-
require 'open-uri'

class Downloader
	def download(url_list_file)
		File.open(url_list_file) {|f|
			f.each do |url|
				puts url
				puts open(url)
			end
		}
	end
end

def main(url_list_file)
	if url_list_file == nil || !File.exist?(url_list_file) then
		abort "set first arg as `url list file'"
	end

	downloader = Downloader.new
	downloader.download(url_list_file)
end

if __FILE__ == $0
	main(ARGV[0])
end