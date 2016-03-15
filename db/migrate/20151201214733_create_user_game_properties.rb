class CreateUserGameProperties < ActiveRecord::Migration
  def change
    create_table :user_game_properties do |t|
      t.integer :user_game_id
      t.integer :property_id
      t.string :name
      t.timestamps null: false
    end
  end
end
