def self.MySQL(opts = {})
	require 'anemone/storage/mysql'
	self::MySQL.new(opts)
end