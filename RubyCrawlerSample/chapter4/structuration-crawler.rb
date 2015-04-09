# -*- coding: utf-8 -*-
require 'open-uri'
require 'digest/sha1'

def crawler(url)
	hash_str = Digest::SHA1.hexdigest(url)
	path="files/"+hash_str
	if !is_exist?(path)
		source = open(url).read
		open(path,'w+b') {|f| f.write(source)}
	end
end

def is_exist?(path)
	File.exist?(path)
end

url = "http://www.yahoo.co.jp/"
crawler(url)