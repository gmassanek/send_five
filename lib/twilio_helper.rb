class TwilioHelper
  
  account_sid = 'ac5d55a33208274796b498b22ed15dd495'
  auth_token = 'b7984c9f4ea7736822b385dcdc488898'

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
