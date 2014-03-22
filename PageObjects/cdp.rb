require '../PageObjects/base'
require 'yaml'



class CDP < Base

  PAGE_TITLE="College Search"

  def initialize(driver)
    super
    visit
    #verify_page
  end

  def visit
   driver.get(@@base_url+"/colleges/A60CD2AB/California/Berkeley/University-of-California-Berkeley/")
  end

  #This test goes to the link on CDP navigation and matches the description on the page
  def cdp_navigation(link)
    @driver.find_element(:link, link).click
    sleep 1
    value=@driver.find_elements(:tag_name,"h2")[1].text
    return value
  end

  #This is a private method. This verifies the page is actually where it is called to be.
  private
  def verify_page
    unless driver.title ==PAGE_TITLE
      raise StandardError, "Page is not Found", "Page title is :#{driver.title}"
    end
  end

  end

