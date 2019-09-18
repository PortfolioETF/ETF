class AddClomnToCloak < ActiveRecord::Migration[5.2]
  def change
    add_column :cloaks, :address, :string
    change_column :cloaks, :address, :string, :null => false
  end
end
