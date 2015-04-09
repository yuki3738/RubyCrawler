# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.hatena.ne.jp/'))

# タグを順番に追ってタイトルタグを抜き出す
puts doc.xpath("/html/head/title")

# 文書内のすべてのtitleタグを抜き出す
puts doc.xpath("//title")

# id指定で特定のulの絞り込み後、
# その配下の3つ目のliタグを抜き出す
puts doc.xpath("//ul[@id='servicelist']/li[3]")

# class指定で検索 classがtitleのh2タグ
puts doc.xpath("//h2[@class='title']")