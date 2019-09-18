class RenoveColumnToCloakLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :cloak_locations, :cloak_locations, :float, null: false
  end
end
