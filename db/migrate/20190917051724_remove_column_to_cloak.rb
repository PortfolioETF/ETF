class RemoveColumnToCloak < ActiveRecord::Migration[5.2]
  def change
    remove_column :cloaks, :closed_day, :integer
  end
end
