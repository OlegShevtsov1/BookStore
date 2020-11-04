class ChangeTypeCvvCreditCards < ActiveRecord::Migration[6.0]
    change_table :credit_cards do |t|
      t.change :cvv, :string, null: true
    end
end
