class ChangeColumnToLocationsRe < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :locations, :location_name, :string
    remove_column :locations, :description, :string
    add_column :locations, :description, :string
  end
end
