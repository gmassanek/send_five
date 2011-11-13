class User < ActiveRecord::Base
  
  has_secure_password
  has_many  :gifts_received,
            :class_name => Gift,
            :foreign_key => :receiver_id
  has_many :gifts_given,
            :class_name => Gift,
            :foreign_key => :giver_id
  
  before_validation :set_passwords
  
  def set_passwords
    return true if password.present? && password_confirmation.present?
    self.password = "test"
    self.password_confirmation = "test"
  end
end
