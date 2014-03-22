require 'watir-webdriver-performance'
require 'watir-webdriver'
require 'test/unit'
require 'yaml'

class Performance  < Test::Unit::TestCase

  urls=[]

  def setup
    @browser = Watir::Browser.new :firefox
    @verification_errors = []
  end

  def test_homepage
    @browser.goto 'www.campusexplorer.com'
    @load_secs  = @browser.performance.summary[:response_time]/1000
    @ttfb= @browser.performance.summary[:time_to_first_byte]
    puts "Response Time: " , @load_secs.to_f
    #assert_equal true, @ttfb <500
    #assert_equal true, @load_secs < 10
    #assert_equal true, @time_to_first_byte < 10
    puts @browser.performance.summary
    puts @browser.performance.timing
  end

  def teardown
    @browser.close
    assert_equal [], @verification_errors
  end

end