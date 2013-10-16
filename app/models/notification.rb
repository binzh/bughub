class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :model_id, :model_name, :readed
end
