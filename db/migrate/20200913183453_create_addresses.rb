class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.integer :zip
      t.string :country
      t.string :phone
      t.integer :address_type
      t.belongs_to :user, foreign_key: { on_delete: :cascade }, null: false

      t.timestamps
    end
  end
end