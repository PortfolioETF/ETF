class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.references :cloak, foreign_key: true, null: false, index: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
