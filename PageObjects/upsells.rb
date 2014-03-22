require '../PageObjects/base'
require '../modules/faker'



class Upsells < Base

  include Fakedata

  PAGE_TITLE="College Search"
  URL ='/colleges/A8551503/online/University-of-Phoenix-Online-School/'


  #TODO Put all the locators on the top


  def initialize(driver)
    super
    visit
    verify_page
  end

  def visit
    driver.get(@@base_url)
  end

  def upsell(phone, zipcode,edu_level,dob,gpa)
    driver.get(@@base_url + "/programs/2508A9E7/California/Santa-Monica/Santa-Monica-College/")
    puts get_current_url
    select('name',"campusexplorer_area_of_study","Computers & IT")
    select('name',"campusexplorer_concentration","Computer Science")
    select('name',"campusexplorer_planned_start_date_code","Less than 1 month")
    select('name',"campusexplorer_is_online_preference_code","Classroom or Online")
    driver.find_element(:css, "button.default.next-step").click
    driver.find_element(:name, "campusexplorer_first_name").clear
    driver.find_element(:name, "campusexplorer_first_name").send_keys first_name
    driver.find_element(:name, "campusexplorer_last_name").clear
    driver.find_element(:name, "campusexplorer_last_name").send_keys last_name
    driver.find_element(:name, "campusexplorer_phone_preferred").clear
    driver.find_element(:name, "campusexplorer_phone_preferred").send_keys phone
    driver.find_element(:name, "campusexplorer_email_address").clear
    driver.find_element(:name, "campusexplorer_email_address").send_keys email_address
    driver.find_element(:name, "campusexplorer_address").clear
    driver.find_element(:name, "campusexplorer_address").send_keys street_address
    driver.find_element(:name, "campusexplorer_zip_cd").clear
    driver.find_element(:name, "campusexplorer_zip_cd").send_keys zipcode
    select('name',"campusexplorer_highest_education_level",edu_level)
    select('name',"campusexplorer_high_school_graduation_year","2014")
    driver.find_element(:name, "campusexplorer_high_school_gpa").clear
    driver.find_element(:name, "campusexplorer_high_school_gpa").send_keys gpa
    select('name',"campusexplorer_gender","Male")
    driver.find_element(:name, "campusexplorer_birthdate_time").clear
    driver.find_element(:name, "campusexplorer_birthdate_time").send_keys dob
    driver.find_element(:css, "button.default.submit").click
    driver.find_element(:class,'get-information').click
    sleep 4
    return driver.find_elements(:tag_name, 'h2')[1].text
  end

  #This method goes to partner school,lead form, and submits upsell
  def partner_lead_upsell(city,state,zip)
    driver.get(@@base_url+"/colleges/A8551503/online/University-of-Phoenix-Online-School/")
    select('xpath',"(//select[@name='universityofphoenix_salutation'])[2]","Mr.")
    driver.find_element(:xpath, "(//input[@name='universityofphoenix_first_name'])[2]").send_keys first_name
    driver.find_element(:xpath, "(//input[@name='universityofphoenix_last_name'])[2]").send_keys last_name
    driver.find_element(:css, "#college-widget > div.embedded.wide > div.campusexplorer-widget > div.step.step1 > div.content > #lead-request-form-widget > div.multi.label > span.elements > input[name=\"universityofphoenix_phone_preferred_multi.phone_preferred_multi_1\"]").send_keys "310"
    driver.find_element(:css, "#college-widget > div.embedded.wide > div.campusexplorer-widget > div.step.step1 > div.content > #lead-request-form-widget > div.multi.label > span.elements > input[name=\"universityofphoenix_phone_preferred_multi.phone_preferred_multi_2\"]").send_keys "222"
    driver.find_element(:css, "#college-widget > div.embedded.wide > div.campusexplorer-widget > div.step.step1 > div.content > #lead-request-form-widget > div.multi.label > span.elements > input[name=\"universityofphoenix_phone_preferred_multi.phone_preferred_multi_3\"]").send_keys "1234"
    select('css',"#college-widget > div.embedded.wide > div.campusexplorer-widget > div.step.step1 > div.content > #lead-request-form-widget > div.multi.label > span.elements > select[name=\"universityofphoenix_phone_preferred_multi.phone_preferred_type\"]","Home")
    driver.find_element(:xpath, "(//input[@name='universityofphoenix_email_address'])[2]").send_keys email_address
    driver.find_element(:xpath, "(//input[@name='universityofphoenix_address_wo_apt'])[2]").send_keys street_address
    driver.find_element(:xpath, "(//input[@name='universityofphoenix_apt_unit'])[2]").send_keys "4"
    driver.find_element(:xpath, "(//input[@name='universityofphoenix_city_nm'])[2]").send_keys city
    select('xpath',"(//select[@name='universityofphoenix_state_cd'])[2]",state)
    driver.find_element(:xpath, "(//input[@name='universityofphoenix_zip_cd'])[2]").send_keys zip
    select('css',"#college-widget > div.embedded.wide > div.campusexplorer-widget > div.step.step1 > div.content > #lead-request-form-widget > p.ceselect.label > label > select[name=\"universityofphoenix_highest_education_level\"]","Have High School Diploma")
    select('xpath',"(//select[@name='universityofphoenix_high_school_graduation_year'])[2]","2013")
    driver.find_element(:xpath, "(//input[@name='universityofphoenix_is_online_preference_code'])[4]").click
    driver.find_element(:css, "#college-widget > div.embedded.wide > div.campusexplorer-widget > div.step.step1 > div.content > #lead-request-form-widget > p.submit > button.default.next-step").click
    select('name',"universityofphoenix_area_of_interest_universityofphoenix","Technology")
    select('name',"universityofphoenix_program","Undergraduate - Bachelor of Science in Information Technology with a Concentration in Business Systems Analysis")
    select('name',"universityofphoenix_planned_start_date_code","Less than 1 month")
    driver.find_element(:name, "universityofphoenix_is_usa_citizen").click
    driver.find_element(:css, "button.default.submit").click
    while  driver.current_url.include? (URL)
      driver.find_element(:css, "button.get-information").click
      sleep 1
    end
    return driver.current_url
  end


  #This is a private method. This verifies the page is actually where it is called to be.
  private
  def verify_page
    unless driver.title ==PAGE_TITLE
      raise StandardError, "Page is not Found", "Page title is :#{driver.title}"
    end
  end
 end

