class ChangeColumnNameForValue < ActiveRecord::Migration
  def change
    rename_column :user_game_properties , :name, :value
  end
end
