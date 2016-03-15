class DestroyColumnNameGamePropertiesTable < ActiveRecord::Migration
  def change
    remove_column :game_properties, :name
  end
end
