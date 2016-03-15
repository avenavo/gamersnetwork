class RenameFriendshipsColumnToStatus < ActiveRecord::Migration
  def change
    rename_column :friendships , :string , :status
  end
end
