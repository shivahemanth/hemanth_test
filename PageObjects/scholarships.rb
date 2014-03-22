require '../PageObjects/base'


class Scholarships < Base

  PAGE_TITLE="Find Scholarships - Scholarship Search | Campus Explorer"

  def initialize(driver)
    super
    visit
    verify_page
  end

  def visit
    driver.get(@@base_url+'/scholarships')
  end

  def landing_page
    driver.find_element(:tag_name,'h1').text
  end

  #This method takes major as a parameter, searches for the scholarship, and verifies the page is returned
  def scholarship_search_by_major(major)
    driver.get(@@base_url + "/scholarships/")
    puts driver.find_element(:xpath,".//*[@id='choose_major_chosen']/ul/li/input").send_key major
    driver.find_element(:xpath,".//*[@id='choose_major_chosen']/div/ul/li[1]").click
    driver.find_element(:xpath, ".//*[@id='submit_btn']").click
    return driver.find_element(:tag_name,'h1').text
  end

  #search options are $50 $1k $10k $20k
  #Tests The preset amount for search filter
  #It returns the 1st value of amount returned on the results page
  def scholarships_search_by_amount(amount)
    if amount==50
      id="amount_min.0"
     elsif
      amount ==1000
      id="amount_min.1"
     elsif
      amount==10000
      id= "amount_min.2"
     else
      amount==20000
      id= "amount_min.3"
    end
      driver.get(@@base_url + "/scholarships/")
      driver.find_element(:id, id).click
      driver.find_element(:id,'submit_btn').click
      return driver.find_elements(:class,"amount")[1].text
   end
  #
  #This is a private method. This verifies the page is actually where it is called to be.
  private
  def verify_page
    unless driver.title ==PAGE_TITLE
      raise StandardError, "Page is not Found"
    end
  end


end