class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
