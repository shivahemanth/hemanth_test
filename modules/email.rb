require 'rubygems'
require 'net/http'
require 'net/imap'

class EmailService
  def initialize
     @imap = Net::IMAP.new('imap.gmail.com',993)
   # @imap = Net::IMAP.new('imap.gmail.com')
  end

  def login_email(user, passwd)
    puts "Login"
    @imap.login(user, passwd)
    @imap.authenticate('sagerimal@gmail.com', 'Sage521802','hdhhd')
  end

  def logout_email
    @imap.logout()
    @imap.disconnect()
  end

  def get_email_body
    @imap.examine('INBOX')
    mailIds = @imap.search(["NOT", "SEEN"])
    mailIds.each do |id|
      body = @imap.fetch(id, 'BODY[TEXT]')
    end
    return body
  end

  def get_email
    msg = []
    @imap.select('INBOX')
    # mailIds = @imap.search(['ALL'])
    mailIds = @imap.search(["NOT", "SEEN"])
    mailIds.each do |id|
      msg = @imap.fetch(id, 'RFC822')[0].attr['RFC822']
      @imap.store(id, "+FLAGS", [:Seen])
    end
    return msg
  end

  def verify_email_text_contain(message, expectedValue)
    if message.include? expectedValue
      puts "TEST PASSED - '#{expectedValue}' exists on page!"
    else
      raise "TEST FAILED - '#{expectedValue}' does not exists on page!"
    end
  end
end

test = EmailService.new
puts test.login_email('sagerimal@gmail.com','Sage521802')
test.get_email_body
