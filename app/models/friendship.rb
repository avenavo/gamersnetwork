class Friendship < ActiveRecord::Base
  validates :status, :friend_id, :user_id, :presence => true

  belongs_to :user
  belongs_to :friend, class_name: "User"
end
