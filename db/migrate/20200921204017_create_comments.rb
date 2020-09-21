class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.string :review, null: false
      t.integer :score, default: 0
      t.integer :status, default: 0
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
