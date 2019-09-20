class AddColimnToCloak < ActiveRecord::Migration[5.2]
  def change
    add_column :cloaks, :imege_id, :string
  end
end
