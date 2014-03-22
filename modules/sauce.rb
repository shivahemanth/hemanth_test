#Saucelab module
require 'selenium-webdriver'
module Saucy


  def define(type)

    type=type.to_sym

    case type
      when :ff, :firefox, :Firefox, :local
        @driver = Selenium::WebDriver.for :firefox
        return @driver

      when :chrome, :Chrome, :sauce_chrome
        caps = Selenium::WebDriver::Remote::Capabilities.chrome
        caps.platform = 'Windows 8'
        caps.version = '32'

      when :"ie 10", :"Internet Explorer", :IEv10, :ie10
        caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
        caps.platform = 'Windows 8'
        caps.version = '10'

      when :"ie 9", :IE9,:"Internet Explorer 9", :IEv9, :ie9
        caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
        caps.platform = 'Windows 7'
        caps.version = '9'

      when :"ie 11", :IE11,:"Internet Explorer 11", :IEv11, :ie11
        caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
        caps.platform = 'Windows 7'
        caps.version = '11'

      when :"IOS 7", :IPHONE,:iphone
        caps = Selenium::WebDriver::Remote::Capabilities.iphone
        caps.platform = 'OS X 10.9'
        caps.version = '7'
        caps['device-orientation'] = 'portrait'
      end

      @driver = Selenium::WebDriver.for(
         :remote,
         :url => "username:api_key@ondemand.saucelabs.com:80/wd/hub",
         :desired_capabilities => caps)
       end
end