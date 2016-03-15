class FriendshipsFix < ActiveRecord::Migration
  def change
    drop_table :friendship_requests
    add_column :friendships, :string, :string
  end
end
