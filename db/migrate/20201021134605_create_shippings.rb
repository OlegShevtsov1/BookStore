class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :name, null: false
      t.integer :from_days, default: 1, null: false
      t.integer :to_days, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
