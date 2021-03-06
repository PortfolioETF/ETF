class CreateClosedDays < ActiveRecord::Migration[5.2]
  def change
    create_table :closed_days, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :cloak, foreign_key: true, null: false, index: true
      t.integer :closed_day, null: false
      t.timestamps
    end
  end
end
