class Order < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :books, through: :items
  belongs_to :user, optional: true
  enum status: { cart: 0, address: 1, fill_delivery: 2, payment: 3, confirm: 4, complete: 5,
                 in_delivery: 6, delivered: 7, canceled: 8 }
end
