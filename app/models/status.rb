class Status < ActiveRecord::Base
  attr_accessible :status_name,:previous_status_id
  validates :status_name, :presence => true, :length => {:maximum => 12}, :allow_blank => false
end
