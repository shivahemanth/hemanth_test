#This Page list all locators, and methods for HomePage
require '../PageObjects/base'

class Home < Base

  PAGE_TITLE="College Search"

  def initialize(driver)
    super
    visit
    verify_page
  end

  def visit
    driver.get(@@base_url)
  end


 #This is a private method. This verifies the page is actually where it is called to be.
  private
  def verify_page()
    unless @driver.title ==PAGE_TITLE
      raise StandardError, "Page is not Found"
    end
  end

  def wait_for(seconds=5)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

  def displayed?(locator)
    @driver.find_element(locator).displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

end