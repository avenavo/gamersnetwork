class AddColumnIsClosedToGameProperties < ActiveRecord::Migration
  def change
    add_column :game_properties, :isclosed,  :boolean, :default => false
  end
end
