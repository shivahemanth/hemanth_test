require 'selenium-webdriver'
require 'test/unit'
require '../PageObjects/upsells'


class Upsell  < Test::Unit::TestCase

   PHONE=3109988788
   ZIPCODE=90405
   STATE='California'
   CITY='Santa Monica'
   EDU_LEVEL='High School Grad'
   DOB='02/01/1995'
   GPA=4.0

  def setup
    @upsell=Upsells.new(@driver)
  end

  def teardown
    @upsell.teardown(@__name__, @passed)
  end


  def test_upsell
    confirmation_page=@upsell.upsell(PHONE,ZIPCODE,EDU_LEVEL,DOB,GPA)
    @upsell.get_cookie
    assert_includes(confirmation_page,'My Dashboard')
  end

  def mtest_partner_upsell
     lead_submission_page=@upsell.partner_lead_upsell(CITY,STATE,ZIPCODE)
     assert_includes(lead_submission_page,'thankyou')
   end

end
