# -*- coding: utf-8 -*-
require 'aws-sdk'
require 'open-uri'
require 'cgi'

AWS.config({
	:access_key_id => 'AWS_ACCESS_KEY',
	:secret_access_key => 'AWS_SECRET_ACCESS_KEY'
})
s3 = AWS::S3.new

@bucket = s3.buckets['your-bucket-name']

def save_image(url)
	filename = File.basename(url)
	obj = @bucket.objects[filename]
	open(url) do |data|
	obj.write(data.read)
	end
end

search_word=URI.encode("cat")
doc = Nokogiri::HTML(open("https://www.flickr.com/search/?q=#{search_word}"))
doc.xpath("//a[@class='rapidnofollow photo-click']/img").each {|link|
	url = link["data-defer-src"]
	#　サムネイル画像
	save_image(url)
}