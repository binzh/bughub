class BugExtra < ActiveRecord::Base
  belongs_to :bug
  attr_accessible :extra_fields
  serialize :extra_fields
end
