require '../PageObjects/base'



  class SearchPage < Base

    PAGE_TITLE="College Search"


  #TODO Put all the locators on the top


  def initialize(driver)
    super
    visit
    verify_page
  end

  def visit
    driver.get(@@base_url)
  end

  #This method takes two arguments: college major, and State desired.
  #[college State is an index list TODO will fill this later]
  def explore_college_search(major, state=nil)
    #first_time_pop_up_close is defined in the base class, and needs whenever a new browser is instantiated
    first_time_popup_close
    driver.find_element(:id, "match_schooltype.0").click
    driver.find_element(:css, ".next").click
    if driver.find_element(:css, ".next").displayed?
       driver.find_element(:css, ".next").click
    end if false
    driver.find_element(:css, "#s2id_autogen1").send_keys major
    sleep 2
    driver.find_elements(:class, "select2-result-label")[0].click
    driver.find_element(:css, ".next").click
    sleep 3
    driver.find_element(:css, "#s2id_autogen2").click
    puts driver.find_elements(:class, "select2-result-label")[0].click
    driver.find_element(:css, ".next").click
    sleep 2
  end

   #This is a global College search, can be used for college or location search
   def global_search(arg)
     first_time_popup_close
     driver.find_element(:id, "keywordsearch-input").send_keys arg
     driver.find_element(:id, "keywordsearch-button").click
   end

    def search_by(program)
      driver.find_element(:link, program).click
    end

    def location_search
      driver.find_element(:id, 'metasearch-type.1').click
    end

    def name_search
      driver.find_element(:id, 'metasearch-type.0').click
    end

    def degree_search
      driver.find_element(:id, 'metasearch-type.2').click
    end


    def search_location_present?
      driver.find_elements(:css, ".name")[0].text
    end

    def search_major_present?
       driver.find_element(:class,"select2-search-choice").text
    end

    def search_and_click_on_srp
      driver.find_element(:xpath,".//*[@id='results']/tbody/tr[1]/td[2]/div/h3/a").click
    end

  #This is a private method. This verifies the page is actually where it is called to be.
  private
  def verify_page
    unless driver.title ==PAGE_TITLE
      raise StandardError, "Page is not Found"
    end
  end



  end