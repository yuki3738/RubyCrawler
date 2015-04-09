#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
require 'webrick'

class TestContentServlet <
	WEBrick::HTTPServlet::AbstractServlet

	def do_GET(req, res)
		# 拡張子で分岐
		res.body = case req.path
			when /\.html$/; html_content req.path
			when /\.txt$/; txt_content req.path
			else; "dummy"
			end

		res.content_type = WEBrick::HTTPUtils.mime_type(req.path_info, WEBrick::HTTPUtils::DefaultMimeTypes)
	end

	def html_content(path)
		node = path[0..-6]
	<<HTML
<html><head><title>#{path}</title></head>
<body><p>
<a href="#{node}/1.html">#{node}/1.html</a><br>
<a href="#{node}/2.html">#{node}/2.html</a><br>
<a href="#{node}.txt">#{node}.txt</a><br>
<a href="http://localhost:7777#{node}.org">
	#{node}.org</a><br>
<a href="/1.html">/1.html</a>
</p></body></html>
HTML
	end

	def txt_content(path)
		"This is #{path}"
	end
end

srv = WEBrick::HTTPServer.new(:BindAddress => '127.0.0.1', :Port => 7777)
srv.mount('/', TestContentServlet)
trap("INT"){ srv.shutdown }
srv.start
