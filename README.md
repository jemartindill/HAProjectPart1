Set Up:
- install ruby 1.9.2 (make sure your ruby/bin folder is in PATH)
- install rubygems
- install selenium webdriver (gem install selenium_webdriver)
- install Chrome browser
- download chromedriver.exe and include it in PATH
- run tests from the root folder with "ruby test_EmptyCart.rb", "ruby test_UpdateAccountDetails.rb", and "ruby test_SubmitOrder.rb"


Issues:

- Asserts are sloppy and I don't have a runner. Possibly add MiniTest and Rake to improve.

- There should be a common function for opening a browser and going to the requested site, and one for the teardown.

- The tests assume that each Search returns a single result - not sure how to make it more dynamic, perhaps using product id or url

- I used an implicit wait of 10 seconds, which is really too long to wait for a page to load. Should verify with PO's how long an acceptable wait is.

- The update account details test results differ from manually updating. When saving new values through selenium, some fields return with no data, which does not happen if you manually update them. This deserves some investigation.

- I occasionally get "pipe error: 109" in the test output, with no visible affect to the test. Need to figure that out and clean it up.

- Folder structure needs definition. I could make a page objects folder and a tests folder, but I would like to know more about app and framework plans first.