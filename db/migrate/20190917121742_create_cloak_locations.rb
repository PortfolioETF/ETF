class CreateCloakLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :cloak_locations, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :cloak, foreign_key: true, null: false, index: true
      t.decimal :cloak_locations, :latitude, precision: 10, scale: 6
      t.decimal :cloak_locations, :longitude, precision: 10, scale: 6
      t.timestamps
    end
  end
end
