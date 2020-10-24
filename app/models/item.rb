class Item < ApplicationRecord
  belongs_to :book, -> { includes :category }, inverse_of: :category
  # belongs_to :book
  belongs_to :order
end
