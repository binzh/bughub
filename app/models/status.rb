class Status < ActiveRecord::Base
  attr_accessible :status_name
  validates :status_name, :presence => true, :length => {:maximum => 8}, :allow_blank => false
end
