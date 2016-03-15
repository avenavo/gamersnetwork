class Comment < ActiveRecord::Base
  validates :comment, :post_id, :user_id, :presence => true
  validates_length_of :comment, maximum: 500

  belongs_to :user
  belongs_to :post
end
