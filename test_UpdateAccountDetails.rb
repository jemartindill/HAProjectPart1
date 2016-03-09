require 'selenium-webdriver'

require_relative 'po_homepage.rb'
require_relative 'po_my_account.rb'
require_relative 'po_your_details.rb'

#UN: jemtest
#pass: testpass

#data 
test_passed = 1
first_name = (0...8).map { (65 + rand(26)).chr }.join
last_name = (0...8).map { (65 + rand(26)).chr }.join
address = "#{Random.rand(300)}" + ' ' + (0...8).map { (65 + rand(26)).chr }.join
city = (0...8).map { (65 + rand(26)).chr }.join
#it would be nice to randomize state and country
state = 'TX'
country = 'USA'
postal_code = (0...5).map {rand(10)}.join
phone = (0...10).map {rand(10)}.join

shipping_first_name = (0...8).map { (65 + rand(26)).chr }.join
shipping_last_name = (0...8).map { (65 + rand(26)).chr }.join
shipping_address = "#{Random.rand(300)}" + ' ' + (0...8).map { (65 + rand(26)).chr }.join
shipping_city = (0...8).map { (65 + rand(26)).chr }.join
#it would be nice to randomize state and country
shipping_state = 'TX'
shipping_country = 'USA'
shipping_postal_code = (0...5).map {rand(10)}.join

#move initialization steps to another file
@driver = Selenium::WebDriver.for :chrome
@driver.manage.timeouts.implicit_wait = 10

#go to the site under test
@driver.navigate.to "http://store.demoqa.com/"

#go to my account
homepage = HomePage.new(@driver)
homepage.my_account

#log in
my_account = MyAccount.new(@driver)
my_account.login('jemtest','testpass')

#go to your details
my_account.your_details
your_details = YourDetails.new(@driver)

#enter data and submit
your_details.enter_first_name(first_name)
your_details.enter_last_name(last_name)
your_details.enter_address(address)
your_details.enter_city(city)
#state is not working currently
#your_details.enter_state(state)
your_details.enter_country(country)
your_details.enter_postal_code(postal_code)
your_details.enter_phone(phone)
your_details.enter_shipping_first_name(shipping_first_name)
your_details.enter_shipping_last_name(shipping_last_name)
your_details.enter_shipping_address(shipping_address)
your_details.enter_shipping_city(shipping_city)
#state is not currently working
#your_details.enter_shipping_state(shipping_state)
your_details.enter_shipping_country(shipping_country)
your_details.enter_shipping_postal_code(shipping_postal_code)

#save profile
your_details.save_profile

#log out
homepage.logout

#log in
my_account.login('jemtest','testpass')

#go to your details
my_account.your_details

#assert saved values
#todo - use gem for asserts - soft asserts here
if your_details.get_first_name.attribute('value') != first_name
	puts "Test Failed = First Name was not saved. Expected : #{first_name} , Actual: #{your_details.get_first_name.attribute('value')}"
	test_passed = 0
end
if your_details.get_last_name.attribute('value') != last_name
	puts "Test Failed = Last Name was not saved. Expected : #{last_name} , Actual: #{your_details.get_last_name.attribute('value')}"
	test_passed = 0
end
if your_details.get_address.attribute('value') != address
	puts "Test Failed = Address was not saved. Expected : #{address} , Actual: #{your_details.get_address.attribute('value')}"
	test_passed = 0
end
if your_details.get_city.attribute('value') != city
	puts "Test Failed = City was not saved. Expected : #{city} , Actual: #{your_details.get_city.attribute('value')}"
	test_passed = 0
end
if your_details.get_country_selected.attribute('text') != country
	puts "Test Failed = Country was not saved. Expected : #{country} , Actual: #{your_details.get_country_selected.attribute('text')}"
	test_passed = 0
end
if your_details.get_postal_code.attribute('value') != postal_code
	puts "Test Failed = Postal Code was not saved. Expected : #{postal_code} , Actual: #{your_details.get_postal_code.attribute('value')}"
	test_passed = 0
end
if your_details.get_phone.attribute('value') != phone
	puts "Test Failed = Phone was not saved. Expected : #{phone} , Actual: #{your_details.get_phone.attribute('value')}"
	test_passed = 0
end
if your_details.get_shipping_first_name.attribute('value') != shipping_first_name
	puts "Test Failed = Shipping First Name was not saved. Expected : #{shipping_first_name} , Actual: #{your_details.get_shipping_first_name.attribute('value')}"
	test_passed = 0
end
if your_details.get_shipping_last_name.attribute('value') != shipping_last_name
	puts "Test Failed = Shipping Last Name was not saved. Expected : #{shipping_last_name} , Actual: #{your_details.get_shipping_last_name.attribute('value')}"
	test_passed = 0
end
if your_details.get_shipping_address.attribute('value') != shipping_address
	puts "Test Failed = Shipping Address was not saved. Expected : #{shipping_address} , Actual: #{your_details.get_shipping_address.attribute('value')}"
	test_passed = 0
end
if your_details.get_shipping_city.attribute('value') != shipping_city
	puts "Test Failed = Shipping City was not saved. Expected : #{shipping_city} , Actual: #{your_details.get_shipping_city.attribute('value')}"
	test_passed = 0
end
if your_details.get_shipping_country_selected.attribute('text') != shipping_country
	puts "Test Failed = Shipping Country was not saved. Expected : #{shipping_country} , Actual: #{your_details.get_shipping_country_selected.attribute('text')}"
	test_passed = 0
end
if your_details.get_shipping_postal_code.attribute('value') != shipping_postal_code
	puts "Test Failed = Shipping Postal Code was not saved. Expected : #{shipping_postal_code} , Actual: #{your_details.get_shipping_postal_code.attribute('value')}"
	test_passed = 0
end
if test_passed == 1
	puts "Test Passed"
end


#close the browser
#move teardown to a method
@driver.close