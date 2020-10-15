class CreateBookImages < ActiveRecord::Migration[6.0]
  def change
    create_table :book_images do |t|
      t.text :image_data
      t.belongs_to :book, foreign_key: { on_delete: :cascade }, index: true
      
      t.timestamps
    end
  end
end
