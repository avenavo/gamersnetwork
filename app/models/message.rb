class Message < ActiveRecord::Base
  validates_presence_of :content
  
  belongs_to :conversation
  belongs_to :user
end