# -*- coding: utf-8 -*-
require 'geocoder'

Geocoder.configure(:language => "ja", :units => "km")

addresses = Geocoder.search("550-0014", :params => {:countorycodes => "ja"})
addresses.each {|address|
	address.data["address_components"].each {|value|
		if value["short_name"] == "JP"
			lat = address.data
				["geometry"]["location"]["lat"]
			lng = address.data
				["geometry"]["location"]["lng"]
			puts "経度：#{lat}"
			puts "緯度：#{lng}"
		end
	}
}