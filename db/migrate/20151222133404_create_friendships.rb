class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :from_id
      t.integer :to_id
      t.boolean :accepted, :default => false
      t.timestamps null: false
    end
  end
end
