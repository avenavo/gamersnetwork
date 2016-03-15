class RenameFriendshipColumns < ActiveRecord::Migration
  def change
    rename_column :friendships, :from_id, :user_id
    rename_column :friendships, :to_id, :friend_id
  end
end
