class EnumField < ActiveRecord::Base
  belongs_to :user_field
  attr_accessible :enum_text
end
