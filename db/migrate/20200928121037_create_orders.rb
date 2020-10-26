class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.belongs_to :user, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
