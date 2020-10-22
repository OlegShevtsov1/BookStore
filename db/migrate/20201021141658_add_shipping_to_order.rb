class AddShippingToOrder < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :orders, :shipping, foreign_key: { on_delete: :nullify }, index: true
  end
end
