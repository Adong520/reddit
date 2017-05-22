class RemoveUserColumnFromPosts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :posts, :user_id
  end
end
