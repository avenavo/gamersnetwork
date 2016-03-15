class DelGameIdColumn < ActiveRecord::Migration
  def change
    remove_column :game_properties, :game_id
  end
end
