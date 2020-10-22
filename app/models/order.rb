class Order < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :books, through: :items
  belongs_to :coupon, optional: true
  belongs_to :user, optional: true
  belongs_to :shipping, optional: true

  enum status: { in_cart: 0, address: 1, shipping: 2 }
end
