class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|

      t.references :user, foreign_key: true, index: true
      t.string :location_name
      t.string :description
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
