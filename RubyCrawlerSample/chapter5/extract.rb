# -*- coding: utf-8 -*-
require 'extractcontent'
require 'open-uri'

html = open('http://blog.takuros.net/entry/20140104/1388788175').read
content, title = ExtractContent.analyse(html)
puts title
puts content