class Users < ActiveRecord::Migration
  def change
    rename_column :users, :name, :username
    add_index :users, :username, unique: true
  end
end
