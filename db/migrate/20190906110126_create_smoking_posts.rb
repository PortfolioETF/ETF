class CreateSmokingPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :smoking_posts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.string :title
      t.text :body
      t.references :location, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.string :image_id
      t.timestamps
    end
  end
end
