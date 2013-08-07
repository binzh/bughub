class FieldType < ActiveRecord::Base
  attr_accessible :type_name
  validates :type_name, :presence => true, :length => {:maximum => 8}, :allow_blank => false
end
