class Comment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :comment, :model_id, :model_name, :user, :user_id
  validates :comment, :model_id, :model_name, :user, :user_id, :presence => true
end
