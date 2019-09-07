class RemoveColumnToSmokingPost < ActiveRecord::Migration[5.2]
  def down
    remove_column :smoking_posts, :user_id, :integer
  end
end
