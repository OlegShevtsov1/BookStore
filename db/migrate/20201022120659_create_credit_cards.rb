class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.string :number
      t.string :date
      t.integer :cvv
      t.belongs_to :order, foreign_key: { on_delete: :cascade }, index: true
  
      t.timestamps
    end
  end
end
