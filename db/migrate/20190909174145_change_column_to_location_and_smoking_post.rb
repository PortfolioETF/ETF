class ChangeColumnToLocationAndSmokingPost < ActiveRecord::Migration[5.2]
  def change
    add_column :smoking_posts, :user_id, :integer, index: true, foreign_key: true
    remove_column :locations, :user_id, :integer
  end
end
