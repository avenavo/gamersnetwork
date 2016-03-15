class CreateGameProperties < ActiveRecord::Migration
  def change
    create_table :game_properties do |t|
      t.integer :game_id
      t.string :name
      t.timestamps null: false
    end
  end
end
