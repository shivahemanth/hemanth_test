require 'selenium-webdriver'
require 'test/unit'
require '../PageObjects/search'


class Search  < Test::Unit::TestCase


  MAJOR =     "Computer Science"
  COLLEGE =   "UCLA"
  PARTNER_SCHOOL= 'ITT'

  def setup
    @search=SearchPage.new(@driver)
  end

  def teardown
    @search.teardown(@__name__, @passed)
  end


  #Searches for a Major in a desired State from the HomePage, and verifies search completion
  def test_search
    @search.explore_college_search(MAJOR)
    page=@search.get_page_source
    assert_includes(page,("All Done! We've Matched You With"))
  end

  #Searches and verifies college from global search menu
  def test_college_search
     @search.global_search(COLLEGE)
     assert_includes(@search.driver.title, COLLEGE)
   end

  #This test searches for a location, like 'CA'and ensures results returned are from CA
  def test_college_search_by_location
    location="CA"
    @search.location_search
    @search.global_search(location)
    assert_includes @search.search_location_present?, location
  end

  def test_search_and_go_to_cdp
    @search.global_search(PARTNER_SCHOOL)
    @search.search_and_click_on_srp
    assert_includes@search.driver.title, PARTNER_SCHOOL

  end

end
