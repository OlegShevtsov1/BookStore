class ItemForm
  DEFAULT_COUNT_ITEM = 1
  MAX_COUNT_ITEMS = 10

  include ActiveModel::Model
  attr_accessor :current_user, :current_item, :quantity

  validates :quantity, presence: true, length: { maximum: MAX_COUNT_ITEMS }
  validates :current_item, presence: true
end
