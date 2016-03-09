class HomePage

	def initialize(driver)
		@driver = driver
		# wait for page load
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		wait.until{@driver.find_element(:name, 's')}
	end

	def search_for_item(item)
		search_box = @driver.find_element(:name, 's')
		search_box.send_keys "#{item}"
		search_box.send_keys :enter
	end

	def add_to_cart
		# maybe use product ID or url to make finding the add to cart button more dynamic
		#add_to_cart_button = @driver.find_element_by_xpath("//form[@name='product_96']/input[@name='Buy']")
		@driver.find_element(:name, 'Buy').click
	end

	def checkout
		@driver.find_element(:link, 'Go to Checkout').click
	end

	def continue
		@driver.find_element(:link, 'Continue Shopping').click
	end

	def my_account
		@driver.find_element(:class, 'account_icon').click
	end

	def logout
		@driver.find_element(:link, '(Logout)').click
	end
	
end