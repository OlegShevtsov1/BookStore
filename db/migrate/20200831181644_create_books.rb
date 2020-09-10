class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.text :description, default: ""
      t.belongs_to :category, foreign_key: { on_delete: :cascade }, null: false

      t.timestamps
    end
  end
end
