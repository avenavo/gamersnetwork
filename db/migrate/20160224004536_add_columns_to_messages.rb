class AddColumnsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_id , :integer
    add_column :messages, :conversation_id, :integer
  end
end
