class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :posts, :users, colunm: :user_id
  	add_foreign_key :comments, :users, column: :user_id
  	add_foreign_key :comments, :posts, column: :post_id

  end
end
