class Post < ActiveRecord::Base
  validates :post, :user_id, :presence => true
  validates_length_of :post, maximum: 1000

  has_many :comments, dependent: :destroy
  belongs_to :user
end
