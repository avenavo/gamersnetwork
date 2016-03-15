class RemoveStatusFromFriendships < ActiveRecord::Migration
  def change
    remove_column :friendships , :status
  end
end
