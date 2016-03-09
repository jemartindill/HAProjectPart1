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
homepage.continue

#search for a different item
homepage.search_for_item("iphone 4s white")

#add item to the cart
homepage.add_to_cart

#go to checkout
homepage.checkout

#empty cart
cart = Cart.new(@driver)
cart.empty_cart

#assert empty cart message
if @driver.page_source.include?("Oops, there is nothing in your cart.")
	puts "Test Passed"
else
	puts "Test Failed - Empty cart text not found"
end

#close the browser
#move teardown to a metho
@driver.close