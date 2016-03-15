class Rollback < ActiveRecord::Migration
  def change
    add_column :game_properties, :game_id, :integer
    add_column :game_properties, :property_id, :integer
  end
end
