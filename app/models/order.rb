class Order < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :books, through: :items
  belongs_to :coupon, optional: true
  belongs_to :user, optional: true

  enum status: { in_cart: 0, address: 1, delivery: 2, payment: 3, confirm: 4, complete: 5, in_delivery: 6,
                 delivered: 7, canceled: 8 }
end
