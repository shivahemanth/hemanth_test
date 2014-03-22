require "json"
require "selenium-webdriver"
require "test/unit"


class Sel < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://stg-search.campusexplorer.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end

  def test_sel
    @driver.get(@base_url + "/static/desktop-cdp-again-hs.html?college=2508A9E7&s=&browser=10.0.2.2.189328518525290&session=4a6ec23df8a346b239060f574193393f3277b80e")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "edit-area-of-study")).select_by(:text, "Computers & IT")
    @driver.find_element(:css, "option[value=\"2A0E73ED\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "edit-cdp-concentration")).select_by(:text, "Computer Science")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "edit-cdp-planned-start-date-code")).select_by(:text, "Less than 1 month")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "edit-cdp-is-online-preference-code")).select_by(:text, "Online Only")
    @driver.find_element(:css, "button.continue").click
    @driver.find_element(:id, "edit-first-name").clear
    @driver.find_element(:id, "edit-first-name").send_keys "test"
    @driver.find_element(:id, "edit-last-name").click
    @driver.find_element(:id, "edit-last-name").click
    @driver.find_element(:id, "edit-last-name").clear
    @driver.find_element(:id, "edit-last-name").send_keys "test"
    @driver.find_element(:id, "edit-phone-preferred").click
    @driver.find_element(:id, "edit-phone-preferred").click
    @driver.find_element(:id, "edit-phone-preferred").clear
    @driver.find_element(:id, "edit-phone-preferred").send_keys "3109932871"
    @driver.find_element(:id, "edit-cdp-email-address").click
    @driver.find_element(:id, "edit-cdp-email-address").click
    @driver.find_element(:id, "edit-cdp-email-address").clear
    @driver.find_element(:id, "edit-cdp-email-address").send_keys "srimahjdhhdh@hotmail.com"
    @driver.find_element(:id, "edit-address").click
    @driver.find_element(:id, "edit-address").click
    @driver.find_element(:id, "edit-address").clear
    @driver.find_element(:id, "edit-address").send_keys "124 wilshire blvd"
    @driver.find_element(:id, "edit-cdp-zip-cd").click
    @driver.find_element(:id, "edit-cdp-zip-cd").click
    @driver.find_element(:id, "edit-cdp-zip-cd").clear
    @driver.find_element(:id, "edit-cdp-zip-cd").send_keys "90404"
    @driver.find_element(:id, "edit-cdp-highest-education-level").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "edit-cdp-highest-education-level")).select_by(:text, "High School Grad")
    @driver.find_element(:css, "option[value=\"high_school\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "edit-cdp-high-school-graduation-year")).select_by(:text, "2013")
    @driver.find_element(:css, "option[value=\"2013\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "edit-how-likely-to-enroll-in-6-months")).select_by(:text, "Very likely")
    @driver.find_element(:css, "option[value=\"Very likely\"]").click
    @driver.find_element(:css, "button.submit").click
    @driver.find_element(:css, "button.get-information").click
    @driver.find_element(:xpath, "(//button[@type='submit'])[2]").click
    @driver.find_element(:xpath, "(//button[@type='submit'])[3]").click
    @driver.find_element(:xpath, "(//button[@type='submit'])[4]").click
    @driver.find_element(:xpath, "(//button[@type='submit'])[5]").click
    @driver.find_element(:xpath, "(//button[@type='submit'])[6]").click
  end


end
