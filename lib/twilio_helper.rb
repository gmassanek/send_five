class TwilioHelper
  
  ACCOUNT_SID = ENV['twilio_ACCOUNT_SID']
  AUTH_TOKEN = ENV['twilio_AUTH_TOKEN']

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
