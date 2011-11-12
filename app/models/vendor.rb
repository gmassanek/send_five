class Vendor < ActiveRecord::Base

  has_many :codes

  def self.available
    vendors = Code.available.collect { |code| code.vendor }
    return vendors.uniq
  end
end
