class Bug < ActiveRecord::Base
  belongs_to :status
  belongs_to :priority
  belongs_to :user
  has_one :bug_extra
  attr_accessible :description, :owner, :summary, :status_id, :priority_id, :user_id, :status, :priority
  validates :summary, :presence => true, :length => {:maximum => 30}, :allow_blank => false
  validates :description, :presence => true, :allow_blank => false
  validates :owner, :presence => true, :numericality => {:only_integer => true}
  validates :status, :presence => true
  validates :priority, :presence => true
  validates :user, :presence => true
end
