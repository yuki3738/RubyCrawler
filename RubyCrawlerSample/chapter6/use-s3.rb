# -*- coding: utf-8 -*-
require 'aws-sdk'

AWS.config({
	:access_key_id => 'AWS_ACCESS_KEY',
	:secret_access_key => 'AWS_SECRET_ACCESS_KEY'
})
s3 = AWS::S3.new

bucket = s3.buckets['your-bucket-name']
tree = bucket.as_tree

# ディレクトリ一覧
directories = tree.children.select(&:branch?).collect(&:prefix)
directories.each{|directory|
	puts directory
}

# ファイル一覧
files = tree.children.select(&:leaf?).collect(&:key)
files.each{|file|
	puts file
}

# キー一覧（ファイル＆ディレクトリ一覧）
puts "keys"
keys = bucket.objects.collect(&:key)
keys.each{|key|
	puts key
}

# サブディレクトリ下のファイルの一覧表示
puts "sub folder"
tree = bucket.as_tree({:prefix => 'subfoldername/'})
files = tree.children.select(&:leaf?).collect(&:key)
files.each{|file|
	puts file
}

# ファイル操作
obj = s3.buckets['your-bucket-name'].objects['filename']

# ファイルの書き込み
obj.write('Hello World!')

# ファイルの読み込み
obj.read