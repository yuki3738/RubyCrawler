# -*- coding: utf-8 -*-
require 'flickraw'

FlickRaw.api_key='FLICKR_API_KEY'
FlickRaw.shared_secret='FLICKR_API_SECRET'

tag = "cat"

images = flickr.photos.search(tags: tag, sort: "relevance", per_page: 20)
images.each{|image|
	url = FlickRaw.url image;
	puts url
}