# -*- coding: utf-8 -*-
require 'nokogiri'

def parser(file)
	doc = Nokogiri::HTML(open(file))
	puts doc.title # => Yahoo! JAPAN
end

def get_file_list(target,parsed)
	puts target
	Dir::foreach(target).each {|file|
		next if file == "." or file == ".."
		parser(target+"/"+file)
		move_file(target+"/"+file,parsed+"/"+file)
	}
end

def move_file(from,to)
	puts from
	puts to
	File.rename(from,to)
end

get_file_list("files","parsed_files")