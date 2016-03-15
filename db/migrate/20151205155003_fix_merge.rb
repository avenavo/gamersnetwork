class FixMerge < ActiveRecord::Migration
  def change
    rename_column :game_properties , :property_id, :game_id
  end
end
