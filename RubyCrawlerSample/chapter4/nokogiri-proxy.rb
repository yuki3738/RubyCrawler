# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp', :proxy => 'http://localhost:5432'))
puts doc.title # => Yahoo! JAPAN