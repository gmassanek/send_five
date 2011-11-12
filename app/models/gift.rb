class Gift < ActiveRecord::Base
  require 'twilio_helper'

  has_one :code
  has_one :vendor, :through => :code
  
  after_create :send_texts

  def send_texts
    TwilioHelper::send_text '+13128542448', '+17736808987', text_message_1
    TwilioHelper::send_text '+13128542448', '+17736808987', text_message_2
  end

  def sender_name
    "sender_name"
  end

  def text_message_1
    "#{sender_name} sent you $5 to #{vendor.name} through SendFive! #{sender_name} says:\n #{message}"
  end

  def text_message_2
    "To redeem your gift, go to your local #{vendor.name} and present the following code:\n #{code.code_number}"
  end

end
