class TwilioHelper
  
  ACCOUNT_SID = 'AC7ab071a2d1b24ab28731dc4f6311e218'
  AUTH_TOKEN = '32e6f4fc57a9d263b65d3879204f4406'

  def self.new_client
    Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def self.send_text from, to, text
    client = new_client
    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => text
    )
  end

end
