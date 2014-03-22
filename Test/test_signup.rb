require 'selenium-webdriver'
require 'test/unit'
require '../PageObjects/signup'


class Sign_up  < Test::Unit::TestCase

  #TODO get data from yaml, or database
  SCHOOL= "Santa Monica High"
  ZIPCODE = 90404
  USER_NAME = 'srimal@campusexplorer.com'
  PASSWORD =  'Sage521802'

  def setup
    @signup=Signup.new(@driver)
  end

  def teardown
    @signup.teardown(@__name__, @passed)
  end

  #Signs up, and verifies "SIGN OUT" is present
  def test_signup
    sign_up=@signup.sign_up(SCHOOL,ZIPCODE)
    assert_equal "Sign Out", sign_up
  end


 #Signs in, and verifies "SIGN OUT" is present
  def test_signin
    sign_out=@signup.sign_in(USER_NAME, PASSWORD)
    assert_equal "Sign Out", sign_out
  end

  def test_facebook
    sign_up=@signup.facebook_sigin
    assert_includes(sign_up, 'College Search')
  end


end
