class Cart

	def initialize(driver)
		@driver = driver
		# wait for page load
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		wait.until{@driver.find_element(:link, 'Continue')}
	end

	def continue
		@driver.find_element(:link, 'Continue').click
	end

	#removes the first item
	#todo - make this more dynamic
	def remove
		@driver.find_element(:xpath, "//input[@value = 'Remove']").click
	end

	def empty_cart
		items = @driver.find_elements(:xpath, "//input[@value = 'Remove']").size - 1
		for i in 0..items
			@driver.find_element(:xpath, "//input[@value = 'Remove']").click
		end
	end

end