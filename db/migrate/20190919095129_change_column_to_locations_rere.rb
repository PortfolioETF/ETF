class ChangeColumnToLocationsRere < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :description, :string
    add_column :locations, :address, :string
  end
end
