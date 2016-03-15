class GameProperty < ActiveRecord::Base
  validates :name, :game_id, :presence => true

  belongs_to :game

  has_many :user_game_properties, :dependent => :destroy
  has_many :users, :through => :user_game_properties

  has_many :closed_values, :dependent => :destroy
end
