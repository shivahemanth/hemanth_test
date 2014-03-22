To run the Tests:

1.Install selenium on your system.
 gem install selenium-webdriver
 or install using bundler
  a.gem install bundler( To install bundler)
  b. bundle install (This will install all the project related dependencies)


2. Go to the Test folder location at t-selenium/lib/Test on the terminal

3. run => rake test browser=local server=qa (browser takes many parameters, local instantiates local FF browser, server parameter
   takes only either dev, qa or prod. DO NOT RUN PROD YET.
   qa is for www.stg.campus and dev runs your local server
   **rake test browser=local server=local will run local server with FF**

4. Some tests like login to Facebook might fail on your local system because of the account not being available

5. When the tests fail, the Framework automatically takes the screen shot of the failure point, and stores in the screenshot
   directory.
