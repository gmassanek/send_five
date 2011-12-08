class Gift < ActiveRecord::Base
  require 'twilio_helper'

  has_one :code
  has_one :vendor, :through => :code

  belongs_to :receiver,
             :class_name => 'User',
             :foreign_key => 'receiver_id'
  
  belongs_to :giver,
             :class_name => 'User',
             :foreign_key => 'giver_id'
  
  before_create :associate_code
  #after_create :send_texts

  def associate_code
    if vendor.nil?
      errors.add(:vendor, "is required") 
      return false
    end

    if vendor.charity?
      code = vendor.codes.build
    else
      code = Code.available.where(:vendor_id => vendor.id).first
    end

    if code.nil?
      errors.add(:vendor, "has no gifts available. Someone must have just stolen the last one!") 
      return false
    else

    end
    self.code = code
  end

  def send_texts
    puts "hello"
    if vendor.charity?
      TwilioHelper::send_text '+13128542448', receiver.phone_number, charity_text_message
   else
     TwilioHelper::send_text '+13128542448', receiver.phone_number, text_message_1
     TwilioHelper::send_text '+13128542448', receiver.phone_number, text_message_2
   end
  end

  def sender_name
    giver.first_name
  end

  def charity_text_message
    "#{sender_name} has donated $5 to #{vendor.name} in your name through SendFive! #{sender_name} says:\n #{message}"
  end

  def text_message_1
    "#{sender_name} sent you $5 to #{vendor.name} through sendfiveNOW!\n'#{message}'"
  end

  def text_message_2
    "To redeem your gift, go to your local #{vendor.name} and present the following code:\n   -----  \n#{code.code_number}"
  end

  def paypal_url(return_url, gift_id, notify_url)
    values = {
      :business => "BRE79W46WYY6A",
      :return => notify_url,
      :amount => 5,
      :shipping => 0.5,
      :currency_code => "USD",
      :item_name => "Send Five Text Message Gift",
      :cmd => "_xclick",
      :item_number => gift_id,
      :notify_url => notify_url,
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
 
end
