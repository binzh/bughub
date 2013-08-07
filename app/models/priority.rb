class Priority < ActiveRecord::Base
  attr_accessible :priority_name
  validates :priority_name, :presence => true, :length => {:maximum => 8}, :allow_blank => false
end
