class YourDetails

	def initialize(driver)
		@driver = driver
		#wait for page load
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		wait.until{@driver.find_element(:id, 'wpsc_checkout_form_2')}
	end

	def get_first_name
		@driver.find_element(:id, 'wpsc_checkout_form_2')
	end

	def get_last_name
		@driver.find_element(:id , 'wpsc_checkout_form_3')
	end

	def get_address
		@driver.find_element(:id , 'wpsc_checkout_form_4')
	end

	def get_city
		@driver.find_element(:id , 'wpsc_checkout_form_5')
	end

	def get_state
		@driver.find_element(:id , 'wpsc_checkout_form_6')
	end

	def get_country
		@driver.find_element(:id, 'wpsc_checkout_form_7')
	end

	def get_country_selected
		get_country.find_element(:css,"option[selected='selected']")
	end

	def get_postal_code
		@driver.find_element(:id , 'wpsc_checkout_form_8')
	end

	def get_phone
		@driver.find_element(:id , 'wpsc_checkout_form_18')
	end

	def get_shipping_first_name
		@driver.find_element(:id, 'wpsc_checkout_form_11')
	end

	def get_shipping_last_name
		@driver.find_element(:id , 'wpsc_checkout_form_12')
	end

	def get_shipping_address
		@driver.find_element(:id , 'wpsc_checkout_form_13')
	end

	def get_shipping_city
		@driver.find_element(:id , 'wpsc_checkout_form_14')
	end

	def get_shipping_state
		@driver.find_element(:id , 'wpsc_checkout_form_15')
	end

	def get_shipping_country
		@driver.find_element(:id, 'wpsc_checkout_form_16')
	end

	def get_shipping_country_selected
		get_shipping_country.find_element(:css,"option[selected='selected']")
	end

	def get_shipping_postal_code
		@driver.find_element(:id , 'wpsc_checkout_form_17')
	end

	def enter_first_name(fisrtname)
		get_first_name.clear
		get_first_name.send_keys "#{fisrtname}"
	end

	def enter_last_name(lastname)
		get_last_name.clear
		get_last_name.send_keys "#{lastname}"
	end

	def enter_address(address)
		get_address.clear
		get_address.send_keys "#{address}"
	end

	def enter_city(city)
		get_city.clear
		get_city.send_keys "#{city}"
	end

	def enter_state(state)
		get_state.clear
		get_state.send_keys "#{state}"
	end

	def enter_country(country)
		get_country.click
		option = Selenium::WebDriver::Support::Select.new(get_country)
		option.select_by(:text, "#{country}")
	end

	def enter_postal_code(postalcode)
		get_postal_code.clear
		get_postal_code.send_keys "#{postalcode}"
	end

	def enter_phone(phone)
		get_phone.clear
		get_phone.send_keys "#{phone}"
	end

	def enter_shipping_first_name(fisrtname)
		get_shipping_first_name.clear
		get_shipping_first_name.send_keys "#{fisrtname}"
	end

	def enter_shipping_last_name(lastname)
		get_shipping_last_name.clear
		get_shipping_last_name.send_keys "#{lastname}"
	end

	def enter_shipping_address(address)
		get_shipping_address.clear
		get_shipping_address.send_keys "#{address}"
	end

	def enter_shipping_city(city)
		get_shipping_city.clear
		get_shipping_city.send_keys "#{city}"
	end

	def enter_shipping_state(state)
		get_shipping_state.clear
		get_shipping_state.send_keys "#{state}"
	end

	def enter_shipping_country(country)
		get_shipping_country.click
		option = Selenium::WebDriver::Support::Select.new(get_shipping_country)
		option.select_by(:text, "#{country}")
	end

	def enter_shipping_postal_code(postalcode)
		get_shipping_postal_code.clear
		get_shipping_postal_code.send_keys "#{postalcode}"
	end

	def save_profile
		@driver.find_element(:name, 'submit').click
	end

end