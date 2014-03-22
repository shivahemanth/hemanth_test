require '../PageObjects/base'



class LeadPage < Base
  include Fakedata


  CDP = '/colleges/41EA7C91/online/ITT-Technical-Institute-Online/'


  def initialize(driver)
    super
    visit

  end

    def visit
    driver.get(@@base_url+CDP)
    end


  def submit_lead_form
  driver.find_element(:xpath, "(//input[@name='itttechonline_first_name'])[2]").send_keys first_name
  driver.find_element(:xpath, "(//input[@name='itttechonline_last_name'])[2]").click
  driver.find_element(:xpath, "(//input[@name='itttechonline_last_name'])[2]").send_keys last_name
  driver.find_element(:xpath, "(//input[@name='itttechonline_address'])[2]").send_keys street_address
  driver.find_element(:xpath, "(//input[@name='itttechonline_zip_cd'])[2]").send_keys 90405
  Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, "(//select[@name='itttechonline_high_school_graduation_year'])[2]")).select_by(:text, "2013")
  Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, "(//select[@name='itttechonline_highest_education_level'])[2]")).select_by(:text, "Some College")
  driver.find_element(:css, "#college-widget > div.embedded.wide > div.campusexplorer-widget > div.step.step1 > div.content > #lead-request-form-widget > p.submit > button.default.next-step").click
  Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "itttechonline_program")).select_by(:text, "BS - Business Management")
  driver.find_element(:name, "itttechonline_phone_preferred").send_keys 3109932871
  driver.find_element(:name, "itttechonline_email_address").send_keys email_address
  Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "itttechonline_planned_start_date_code")).select_by(:text, "1-3 months")
  driver.find_element(:css, "button.default.submit").click
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  wait.until { driver.find_element(:xpath ,"html/body/div[1]/div[3]/div[1]/div/div/p[1]") }
  end
  end
