class DescriptionToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :first_name, :string, null: false
    add_column :authors, :last_name, :string, null: false
    add_column :authors, :description, :text

    add_index :authors, [:first_name, :last_name], unique: true

    remove_column :authors, :name
  end
end
