class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.references :user, foreign_key: true, index: true
      t.string :location_name
      t.string :description
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.timestamps
    end
  end
end
