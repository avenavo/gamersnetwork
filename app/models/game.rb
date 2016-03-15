class Game < ActiveRecord::Base
  validates_presence_of :name
  
  has_attached_file :banner
  has_attached_file :asset,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }


  has_many :user_games, :dependent => :destroy
  has_many :users, :through => :user_games

  has_many :game_properties, :dependent => :destroy

  scope :games_by_name, -> { order(name: :asc) }

  def self.search(query)
    where("name ilike ?", "%#{query}%") 
  end
end