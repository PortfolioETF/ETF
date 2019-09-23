class CreateEmergencyClosedDays < ActiveRecord::Migration[5.2]
  def change
    create_table :emergency_closed_days do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :cloak, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
