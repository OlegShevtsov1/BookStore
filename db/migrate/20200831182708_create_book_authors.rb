class CreateBookAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :book_authors do |t|
      t.belongs_to :book, foreign_key: true, null: false
      t.belongs_to :author, foreign_key: true, null: false

      t.timestamps
    end
  end
end
