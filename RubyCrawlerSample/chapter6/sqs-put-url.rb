# -*- coding: utf-8 -*-
require 'aws-sdk'

AWS.config(
	:access_key_id => 'AWS_ACCESS_KEY',
	:secret_access_key => 'AWS_SECRET_ACCESS_KEY',
	:sss_endpoint => 'sqs.ap-northeast-1.amazonaws.com'
)

url = 'AWS_SQS_ENDPOINT'
sqs = AWS::SQS.new

# URLリストを登録
f = open("url_list.txt")
f.each {|line|
	sqs.queues[url].send_message(line)
}