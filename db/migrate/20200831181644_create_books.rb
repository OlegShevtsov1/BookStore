class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.text :description, default: ""
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
