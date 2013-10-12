class BugHistory < ActiveRecord::Base
  belongs_to :bug
  belongs_to :user
  attr_accessible :bug_field, :new_value, :old_value, :user
  validates :bug_field, :new_value, :user, :presence => true
end
