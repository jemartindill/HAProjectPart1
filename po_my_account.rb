class MyAccount

	def initialize(driver)
		@driver = driver
		#wait for page load
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		wait.until{@driver.find_element(:id, 'log')}
	end

	def login(username, password)
		@driver.find_element(:id, 'log').send_keys "#{username}"
		@driver.find_element(:id, 'pwd').send_keys "#{password}"
		@driver.find_element(:id, 'login').click
	end

	def your_details
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		wait.until{@driver.find_element(:link, 'Your Details')}
		@driver.find_element(:link, 'Your Details').click
	end

end