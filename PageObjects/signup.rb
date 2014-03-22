require '../PageObjects/base'


class Signup < Base

  PAGE_TITLE="Sign Up with Campus Explorer"
  FACEBOOK_USERNAME='srimal@campusexplorer.com'
  FACEBOOK_PASSWORD='Sage521802'


  def initialize(driver)
    super
    visit
    verify_page
  end

  def visit
    driver.get(@@base_url+'/signup')
  end


  #Method to signup as a new user
  #Fake data are used using Faker module
  def sign_up(school,zipcode)
    driver.find_element(:link, "Sign Up").click
    driver.find_element(:link, "Sign Up With Your Email Address").click
    driver.find_element(:id, "first_name").click
    driver.find_element(:id, "first_name").send_keys first_name
    driver.find_element(:id, "last_name").click
    driver.find_element(:id, "last_name").send_keys last_name
    driver.find_element(:id, "user-user-type-orig").click
    driver.find_element(:id, "uutype-li-group-in-high-school").click
    driver.find_element(:id, "uutype-li-high_school_freshman").click
    driver.find_element(:id, "enrolled-or-attended-high-school-name").send_keys school
    driver.find_element(:id, "zip-cd").send_keys zipcode
    driver.find_element(:id, "emailaddr").send_keys email_address
    driver.find_element(:id, "password").send_keys password
    driver.find_element(:id, "signin-signup-submit").click
    return  driver.find_element(:link, "Sign Out").text
  end

  #Switch between windows to manage pop-ups
  #This methods uses campus login with Facebook api, and return Page Title
  def facebook_sigin
    driver.get(@@base_url+ "/panel/signin/")
    driver.find_element(:link, "Sign Up").click
    driver.find_element(:css, "img[alt=\"Login with Facebook\"]").click
    window_handles=  driver.window_handles
    driver.switch_to.window(window_handles[1])
    driver.find_element(:id, "email").clear
    driver.find_element(:id, "email").send_keys FACEBOOK_USERNAME
    driver.find_element(:id, "pass").clear
    driver.find_element(:id, "pass").send_keys FACEBOOK_PASSWORD
    driver.find_element(:name, 'login').click
    window_handles=  driver.window_handles
    driver.switch_to.window(window_handles)
    sleep 2
    driver.title
  end

  #This is a private method. This verifies the page is actually where it is called to be.
  private
  def verify_page
    unless driver.title ==PAGE_TITLE
      raise StandardError, "Page is not Found"
    end
  end

  def wait_for(seconds=5)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

  def displayed?(locator)
    driver.find_element(locator).displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

end