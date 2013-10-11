class UserField < ActiveRecord::Base
  belongs_to :field_type
  has_many :enum_fields
  attr_accessible :field_name, :required, :field_type_id
  validates :field_type, :presence => true
  validates :field_name, :presence => true, :length => {:maximum => 8}, :allow_blank => false
  validates :required, :inclusion => {:in => [true, false]}
end
