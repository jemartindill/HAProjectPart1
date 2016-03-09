require 'selenium-webdriver'

require_relative 'po_homepage.rb'
require_relative 'po_cart.rb'
require_relative 'po_checkout.rb'

#move initialization steps to another file
@driver = Selenium::WebDriver.for :chrome
@driver.manage.timeouts.implicit_wait = 10

#go to the site under test
@driver.navigate.to "http://store.demoqa.com/"

#search for the desired item
homepage = HomePage.new(@driver)
homepage.search_for_item("iphone 4s black")

#add the item to the cart
#this currently assumes one result from the search
homepage.add_to_cart

#go to checkout
homepage.checkout

#continue to checkout page
cart = Cart.new(@driver)
cart.continue

#select the country
checkout = Checkout.new(@driver)
checkout.select_country("USA")

#calculate the total
checkout.calculate

#check for correct total
#add framework for asserts
if checkout.checkout_total.text == "$282.00"
	puts "Test Passed"
else
	puts "Test Failed - Checkout Total was not $282.00"
end

#close the browser
#move teardown to a metho
@driver.close