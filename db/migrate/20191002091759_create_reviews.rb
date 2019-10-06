class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :user, foreign_key: true, index: true
      t.references :cloak, foreign_key: true, index: true
      t.text :review

      t.timestamps
    end
  end
end
