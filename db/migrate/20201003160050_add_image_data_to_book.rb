class AddImageDataToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :image_data, :text
  end
end
