class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :quantity, default: 0
      t.belongs_to :book, foreign_key: { on_delete: :cascade }, index: true
      t.belongs_to :order, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
