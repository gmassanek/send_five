class Gift < ActiveRecord::Base

  has_one :code
  #has_one :vendor, :through => :code

end
