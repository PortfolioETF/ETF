class CreateCloakLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :cloak_locations do |t|
      t.references :cloak, foreign_key: true, null: false, index: true
      t.float :cloak_locations, :latitude, null: false
      t.float :cloak_locations, :longitude, null: false
      t.timestamps
    end
  end
end
