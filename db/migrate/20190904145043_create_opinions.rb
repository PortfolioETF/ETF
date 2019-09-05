class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.references :user, foreign_key: true, index: true
      t.text :opinion, default: ""
      t.integer :withdraw_flag, default: 0
      t.timestamps
    end
  end
end
