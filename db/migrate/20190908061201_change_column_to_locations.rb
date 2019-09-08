class ChangeColumnToLocations < ActiveRecord::Migration[5.2]
    def down
      remove_column :locations, :location_name, :string
      remove_column :locations, :description, :string
    end
  end
