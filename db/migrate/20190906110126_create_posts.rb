class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.string :title
      t.text :body
      t.references :location, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.string :image_id
      t.integer :post_flag, null: false, default: 3
      t.timestamps
    end
  end
end
