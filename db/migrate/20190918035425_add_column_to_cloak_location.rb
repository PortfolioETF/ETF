class AddColumnToCloakLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :cloak_locations, :description, :text
  end
end
