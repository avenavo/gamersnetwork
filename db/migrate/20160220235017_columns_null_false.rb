class ColumnsNullFalse < ActiveRecord::Migration
  def change
    change_column_null :closed_values, :game_property_id, false
    change_column_null :closed_values, :value, false
    
    change_column_null :comments, :comment, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :post_id, false

    change_column_null :friendships, :user_id, false
    change_column_null :friendships, :friend_id, false
    change_column_null :friendships, :status, false

    change_column_null :game_properties, :game_id, false
    change_column_null :game_properties, :name, false

    change_column_null :games, :name, false

    change_column_null :posts, :post, false
    change_column_null :posts, :user_id, false

    change_column_null :user_game_properties, :game_property_id, false
    change_column_null :user_game_properties, :user_id, false

    change_column_null :user_games, :user_id, false
    change_column_null :user_games, :game_id, false

    






 






  end
end
