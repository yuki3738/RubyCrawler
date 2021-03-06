#   - * -   c o d i n g :   u t f - 8   - * - 
require 'cgi'
def parse(page_source)
  dates = page_source.scan(%r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)
  url_titles = page_source.scan(%r!^<a href="(.+?)">(.+?)</a><br />!)

  url_titles.zip(dates).map{|(aurl, atitle),
    ymd|[CGI.unescapeHTML(aurl),
    CGI.unescapeHTML(atitle), Time.local(*ymd)]
  }
end

 d e f   f o r m a t _ t e x t ( t i t l e ,   u r l ,   u r l _ t i t l e _ t i m e _ a ry ) 
  s = "Title: #{title}\nURL: #{url}\n\n"
  url_title_time_ary.each do |aurl, atitle, atime|
    s << "* (#{atime})#{atitle}\n"
    s << " #{aurl}\n"
  end
  s
end

 p u t s   f o r m a t _ t e x t ( " W W W . S B C R . J P  トピックス", " h t t p : / / c r a w l e r . s b c r . j p / s a m p l e p a g e . h t m l ",
 	  parse ( `/usr/local/bin/wget   - q   - O-  http://crawler.sbcr.jp/samplepage.html ` ) ) 
