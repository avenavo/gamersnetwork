class CreateClosedValues < ActiveRecord::Migration
  def change
    create_table :closed_values do |t|
      t.integer :game_property_id
      t.string :value
      t.timestamps null: false
    end
  end
end
