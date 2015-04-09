# -*- coding: utf-8 -*-
require 'gmail'

gmail = Gmail.connect('GOOGLE_ID', 'GOOGLE_PASS')
gmail.deliver do
	to "example@example.com"
		subject "日本語"
		text_part do
		body "日本語"
	end
end

gmail.logout