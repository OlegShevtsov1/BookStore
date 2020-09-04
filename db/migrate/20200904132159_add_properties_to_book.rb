class AddPropertiesToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :year, :integer
    add_column :books, :heigth, :float
    add_column :books, :width, :float
    add_column :books, :depth, :float
    add_column :books, :material, :string
  end
end
