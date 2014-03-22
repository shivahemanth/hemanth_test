require 'selenium-webdriver'
require 'test/unit'
require '../PageObjects/cdp'

class CDPage < Test::Unit::TestCase


  def setup
    @cdp=CDP.new(@driver)
  end
  #
  def teardown
    @cdp.teardown(@__name__, @passed)
  end


  def test_academics
    desc='Majors & Degrees'
    cdp_page=@cdp.cdp_navigation("Academics")
    assert_includes(cdp_page,desc)
  end

  def test_tuition_and_financial_aid
    desc='Tuition & Fees'
    cdp_page=@cdp.cdp_navigation("Tuition & Financial Aid")
    assert_includes(cdp_page,desc)
  end

  def test_admissions
    desc="Applicant Information"
    cdp_page=@cdp.cdp_navigation("Admissions")
    assert_includes(cdp_page,desc)
  end

  def test_college_life
    desc="Housing"
    cdp_page=@cdp.cdp_navigation("College Life")
    assert_includes(cdp_page,desc)
  end

  def test_photos_and_videos
    desc="Photos & Videos"
    cdp_page=@cdp.cdp_navigation("Photos & Videos")
    assert_includes(cdp_page,desc)
  end

  def test_Reviews
    desc="Reviews"
    cdp_page=@cdp.cdp_navigation("Reviews")
    assert_includes(cdp_page,desc)
  end
end
