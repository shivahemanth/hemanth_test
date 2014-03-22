require 'selenium-webdriver'
require 'test/unit'
require '../PageObjects/lead_form'


class LeadForm  < Test::Unit::TestCase


  def setup
    @lead=LeadPage.new(@driver)
  end
  #
  def teardown
    @lead.teardown(@__name__, @passed)
  end

   def test_lead
     @lead.submit_lead_form
     assert_includes("College Search and Planning Guide - Campus Explorer", @lead.driver.title)
   end

  end

