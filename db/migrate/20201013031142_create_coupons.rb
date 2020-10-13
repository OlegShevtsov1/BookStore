class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.integer :discount, default: 10
      t.string :code, null: false
      
      t.timestamps
    end
  end
end
