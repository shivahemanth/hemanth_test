require 'selenium-webdriver'
require 'test/unit'
class Upsellsss < Test::Unit::TestCase
  PHONE=3109988788
  ZIPCODE=90405
  STATE='California'
  CITY='Santa Monica'
  EDU_LEVEL='High School Grad'
  DOB='02/01/1995'
  GPA=4.0

#
#url1 ="http://stg.campusexplorer.com/programs/2508A9E7/California/Santa-Monica/Santa-Monica-College/"
#url2= "http://stg-search.campusexplorer.com/static/desktop-cdp-again-hs.html?college=2508A9E7&s=&browser=10.0.2.2.189328518525290&session=bab8348e6092a1d30684f360d4325ba0c95f5368"
#url3= "http://stg.campusexplorer.com/programs/2508A9E7/California/Santa-Monica/Santa-Monica-College/"
#
#url=[url1,url2,url3]
#for i in url
#@driver=Selenium::WebDriver.for :firefox
#
#@driver.get(i)
#puts  @driver.current_url
#end
  def upsell(phone, zipcode, edu_level, dob, gpa)
    driver.get(@@base_url + "/programs/2508A9E7/California/Santa-Monica/Santa-Monica-College/")
    puts get_current_url
    select('name', "campusexplorer_area_of_study", "Computers & IT")
    select('name', "campusexplorer_concentration", "Computer Science")
    select('name', "campusexplorer_planned_start_date_code", "Less than 1 month")
    select('name', "campusexplorer_is_online_preference_code", "Classroom or Online")
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
    select('name', "campusexplorer_highest_education_level", edu_level)
    select('name', "campusexplorer_high_school_graduation_year", "2014")
    driver.find_element(:name, "campusexplorer_high_school_gpa").clear
    driver.find_element(:name, "campusexplorer_high_school_gpa").send_keys gpa
    select('name', "campusexplorer_gender", "Male")
    driver.find_element(:name, "campusexplorer_birthdate_time").clear
    driver.find_element(:name, "campusexplorer_birthdate_time").send_keys dob
    driver.find_element(:css, "button.default.submit").click
    driver.find_element(:class, 'get-information').click
    sleep 4
    return driver.find_elements(:tag_name, 'h2')[1].text
  end

  def test_upsell
    upsell(PHONE, ZIPCODE, EDU_LEVEL, DOB, GPA)
    assert_includes(confirmation_page, 'My Dashboard')
  end

end