class Order < ApplicationRecord
  include AASM

  has_many :items, dependent: :destroy
  has_many :books, through: :items
  belongs_to :coupon, optional: true
  belongs_to :user, optional: true
  belongs_to :shipping, optional: true

  enum status: { in_cart: 0, address: 1, delivery: 2, payment: 3 }

  aasm :status, enum: true do
    state :in_cart, initial: true
    state :address
    state :delivery
    state :payment

    event :address do
      transitions from: :in_cart, to: :address
    end

    event :delivery do
      transitions from: :address, to: :delivery
    end

    event :payment do
      transitions from: :delivery, to: :payment
    end
  end
end
