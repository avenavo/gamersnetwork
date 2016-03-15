class MergePropertiesAndGameProperties < ActiveRecord::Migration
  def change
    remove_column :game_properties, :game_id
    add_column :game_properties, :name , :string

    # drop_table :properties
  end
end
