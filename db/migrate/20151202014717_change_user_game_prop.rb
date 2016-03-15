class ChangeUserGameProp < ActiveRecord::Migration
  def change
    rename_column :user_game_properties, :user_game_id, :game_id
    add_column :user_game_properties, :user_id,  :integer
  end
end
