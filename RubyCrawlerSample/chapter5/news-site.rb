class NewsSite
# アクセサメソッド
attr_reader :base_url
attr_reader :url

def initialize(site)
	@site = site
	@base_url = site.base_url
	@url = site.url

	# サイトごとの実装クラスが
	# 必要なメソッドを備えているかチェック
	methods.each do |method|
		if !@site.respond_to?(method.to_sym)
			raise "Site adapter must support method #{method}"
		end
	end
end

def scrape(doc)
	@site.scrape(doc)
end