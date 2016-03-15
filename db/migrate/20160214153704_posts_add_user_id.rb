class PostsAddUserId < ActiveRecord::Migration
  def change
    remove_column :posts, :title
    add_column :posts, :user_id , :string
  end
end
