class ChangeCloaksColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :cloaks, :imege_id, :image_id
  end
end
