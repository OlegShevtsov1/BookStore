class ItemForm
  DEFAULT_COUNT_ITEM = 1
  MAX_COUNT_ITEMS = 10

  include ActiveModel::Model
  attr_accessor :current_user, :current_item, :quantity

  validates :quantity, presence: true, length: { maximum: MAX_COUNT_ITEMS },
                       numericality: { only_integer: true, greater_than: 0 }
  validates :current_item, presence: true
end
