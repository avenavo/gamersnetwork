class PostsCommentsColumnNames < ActiveRecord::Migration
  def change
    rename_column :posts, :description, :post
    change_column :comments, :comment, :text
  end
end
