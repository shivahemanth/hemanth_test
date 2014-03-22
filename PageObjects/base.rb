#The generic base page class is what everything else extends. It contains the instantiation code common to all pages,
#and the class methods needed to define elements and methods (more on these later).
require 'selenium-webdriver'
require 'test/unit'
require '../modules/faker'
require '../modules/sauce'
require 'yaml'

class Base < Test::Unit::TestCase

     include Fakedata
     include Saucy


      attr_reader :driver
      data=YAML.load_file(File.expand_path(File.dirname(__FILE__) +'/../campus.yml'))

    case  data['server']['group']
      when "local"
        @@base_url=data['url']['dev']
      when "prod"
        @@base_url=data['url']['prod']
      when "qa"
        @@base_url=data['url']['qa']
    end

     @@browser= data['env_']['browser']


     def initialize(driver)
       puts "-----You are running #{@@browser} browser on  #{@@base_url}"
       @driver=driver
       @driver = define(@@browser)
       @driver.manage.timeouts.implicit_wait = 15
       @driver.manage.window.maximize
     end

    def teardown(arg=nil,passed)
       @passed=passed
       if not @passed
         @driver.save_screenshot("../Screenshots/#{@@browser+": "+arg}.png")
       end
       @driver.quit
    end


    def driver
      @driver
    end

    def visit(url='/')
      driver.get(@@base_url + url)
    end

    def first_time_popup_close
      @driver.find_element(:css, '.close').click
    end

    def get_page_source
      @driver.page_source
    end

    def get_current_url
       @driver.current_url
    end

    def get_cookie(name=nil)
       #Gets the cookie on the browser page that currently has focus.
       #The cookie that is returned by get_cookie is actually a dictionary that contains all the cookie info.
       #To get the cookie's 'value', you must look up the 'value' key in the dictionary that is returned.
       if not nil
       cookie_value = @driver.manage.all_cookies.find { |c| c[:name] == name }
       return cookie_value
       else
         return @driver.manage.all_cookies
       end
    end

     def find(locator)
      driver.find_element locator
    end

    def clear(locator)
      driver.find_element(locator).clear
    end

    def type(locator, input)
      driver.find_element(locator).send_keys input
    end

    def click_on(locator)
      driver.find_element(locator).click
    end

    def displayed?(locator)
      driver.find_element(locator).displayed?
      true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end

    def text_of(locator)
      driver.find_element.find(locator).text
    end

    def title
      driver.title
    end

    #def select(type, locator_name,value)
    #  Selenium::WebDriver::Support::Select.new(driver.find_element(:name, locator_name)).select_by(:text, value)
    #end

     def select(type,locator_name,value)
       Selenium::WebDriver::Support::Select.new(driver.find_element(type.to_sym,locator_name)).select_by(:text, value)
     end

    def sign_in(username, password)
      @driver.get(@@base_url+'/panel/signin/')
      @driver.find_element(:id, "emailaddr").clear
      @driver.find_element(:id, "emailaddr").send_keys username
      @driver.find_element(:id, "password").clear
      @driver.find_element(:id, "password").send_keys password
      @driver.find_element(:css, "p.submit > button[type=\"submit\"]").click
      return  @driver.find_element(:link, "Sign Out").text
    end

    def wait(type, locator)
     wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
     wait.until { driver.find_element(type.to_sym ,locator) }

    end
  
  end

