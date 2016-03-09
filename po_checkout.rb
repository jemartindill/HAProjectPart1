class Checkout

	def initialize(driver)
		@driver = driver
		#wait for page load
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		wait.until{@driver.find_element(:css, '.info.act')}
	end

	def select_country(country)
		country_selector = @driver.find_element(:id, 'current_country')
		country_selector.click
		option = Selenium::WebDriver::Support::Select.new(country_selector)
		option.select_by(:text, "#{country}")
	end

	def calculate
		calculate_button = @driver.find_element(:name, 'wpsc_submit_zipcode')
		calculate_button.click
	end

	def checkout_total
		@driver.find_element(:id, 'checkout_total')
	end
	
end