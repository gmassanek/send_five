class Code < ActiveRecord::Base

  belongs_to :vendor
  belongs_to :gift

  scope :available, where(:sent => false)

  before_save :set_assigned

  def set_assigned
    self.sent = true if self.gift_id.present?
  end

end
