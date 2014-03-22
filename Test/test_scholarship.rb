require '../PageObjects/scholarships'
require "json"
require "selenium-webdriver"
require "test/unit"

class Scholarship < Test::Unit::TestCase

  def setup
    @scholarship= Scholarships.new(@driver)
  end

  def teardown
    @scholarship.teardown(@__name__, @passed)
  end

  def test_scholarship
    scholarship_page=@scholarship.scholarship_search_by_major("Accounting")
    assert_includes(scholarship_page,"Accounting Scholarships")
  end

  def test_landing_page
    landing_page=@scholarship.landing_page
    assert_includes(landing_page,"Scholarships")
  end

  #This test iterates through each value of scholarship, and ensures the search results returned are more than the minimum amount selected
  def test_scholoarship_filter
    amount=[50,1000,10000,20000]
    amount.each do |t|
    scholarship_page=@scholarship.scholarships_search_by_amount(t)
    assert(t.to_s>scholarship_page)
    end

  end

 end



