class ChangeFriendshipcolumnFix < ActiveRecord::Migration
  def change
      remove_column :friendships, :status
      add_column :friendships, :status,  :string
  end
end
