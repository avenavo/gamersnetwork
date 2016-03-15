class RenameAndRemoveUserGamePropertiesColumns < ActiveRecord::Migration
  def change
    rename_column :user_game_properties, :property_id, :game_property_id
    remove_column :user_game_properties, :game_id, :integer
  end
end
