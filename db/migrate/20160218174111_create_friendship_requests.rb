class CreateFriendshipRequests < ActiveRecord::Migration
  def change
    create_table :friendship_requests do |t|
       t.integer  "user_id"
       t.integer  "friend_id"
       t.boolean   "status"
       t.timestamps null: false
    end
  end
end
