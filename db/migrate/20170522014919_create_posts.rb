class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|

      t.string :title
      t.text :content

      #t.integer :user_id

      t.belongs_to :user, index: true

      t.timestamps
    end

    #add_index :posts, user_id
    #add_foreign_key :posts,:users

  end
end
