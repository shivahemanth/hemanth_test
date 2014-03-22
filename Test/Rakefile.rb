require  'rake/testtask'
require 'rake'
require 'yaml'

#The task takes a parameter to run the test
#To run locally => rake test browser=local from the Test directory
#To run on Saucelabs => take test browser=ff, ie 10 etc
#To run on www.stg pass parameter server=qa, and server=dev etc
#More info on README.txt
#Check Sauce module on the module directory for all available remote clients

Rake::TestTask.new() do |t|

  browser=ENV['browser']
  server=ENV['server']
  data=YAML.load_file(File.expand_path(File.dirname(__FILE__) +'/../campus.yml'))
  data['env_']['browser'] = browser.to_s
  data['server']['group'] = server.to_s
  File.open((File.expand_path(File.dirname(__FILE__) +'/../campus.yml')), 'w') {|f| f.write data.to_yaml }
  t.libs << "test"
  t.test_files = FileList['test*.rb']
  t.verbose = true
end