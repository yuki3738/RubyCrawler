require 'mechanize'

uri=URI.parse('https://affiliate.amazon.co.jp/')
agent = Mechanize.new
agent.user_agent_alias = 'Mac Safari'
page = agent.get(uri)
next_page = page.form_with(:name => 'sign_in') do |form|
	form.username = 'your_username'
	form.password = 'your_password'
end.submit
puts next_page.search('//*[@id="mini-report"]/div[5]/div[2]').text