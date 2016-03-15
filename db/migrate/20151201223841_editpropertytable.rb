class Editpropertytable < ActiveRecord::Migration
  def change
    rename_column :user_game_properties, :property_id, :game_property_id
  
  end
end
