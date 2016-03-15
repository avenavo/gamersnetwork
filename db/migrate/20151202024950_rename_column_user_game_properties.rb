class RenameColumnUserGameProperties < ActiveRecord::Migration
  def change
    rename_column :user_game_properties, :game_property_id, :property_id
  end
end
