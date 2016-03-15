class UserGameProperty < ActiveRecord::Base
  validates :user_id, :game_property_id, :presence => true

  belongs_to :user
  belongs_to :game_property
end
