# -*- coding: utf-8 -*-
require 'page_rankr'

target_url = "d.hatena.ne.jp/dkfj"

# target_url = "blog.takuros.net"
puts "バックリンク数 チェック"
puts PageRankr.backlinks(target_url, :google, :bing, :yahoo, :alexa)
puts "インデックス数 チェック"
puts PageRankr.indexes(target_url, :google, :bing, :yahoo)
puts "ページランク チェック"
puts PageRankr.ranks(target_url, :alexa_us, :alexa_global, :google, :moz_rank, :page_authority)