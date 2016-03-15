class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :asset,
    :default_url => ":style/missing.jpg",
    :styles => {
      :thumb => "50x50",
      :small  => "100x100",
      :medium => "150x150" }
 
  validates_attachment :asset,
    size: { less_than: 3.megabytes },
    content_type: { content_type: /^image\/(jpg|jpeg|png|gif)$/ }

  validates :asset, unless: 'asset.queued_for_write[:original].blank?', dimensions: { width: 250, height: 250 }



  has_many :user_games, :dependent => :destroy
  has_many :games, :through => :user_games

  has_many :user_game_properties, :dependent => :destroy
  has_many :game_properties, :through => :user_game_properties

  has_many :friendships, :dependent => :destroy

  has_many :friends, -> { where(friendships: { status: 'accepted' }) }, :through => :friendships

  scope :last_seen, -> { where("last_activity_at > ?", 60.seconds.ago).order('last_activity_at DESC') }

  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id", :dependent => :destroy
  has_many :pending_friends, -> { where(friendships: { status: 'false' }) }, :through => :friendships, :source => :friend, :dependent => :destroy
  has_many :requested_friendships, -> { where(friendships: { status: 'false' }).order('created_at') }, :through => :passive_friendships, :source => :user, :dependent => :destroy


  validates :username,
  username_convention: :true,
  presence: true,
  length: {
    maximum: 20,
    minimum: 3
  },
  uniqueness: {
    :case_sensitive => false
  }


  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def self.search(query)
    where("username ilike ?", "%#{query}%") 
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :conversations, :foreign_key => :sender_id


end
