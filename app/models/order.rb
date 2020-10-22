class Order < ApplicationRecord
  include AASM

  has_many :items, dependent: :destroy
  has_many :books, through: :items
  belongs_to :coupon, optional: true
  belongs_to :user, optional: true
  belongs_to :shipping, optional: true
  has_one :credit_card, dependent: :destroy

  enum status: { in_cart: 0, address: 1, delivery: 2, payment: 3, confirm: 4, complete: 5 }

  aasm :status, enum: true do
    state :in_cart, initial: true
    state :address
    state :delivery
    state :payment
    state :confirm
    state :complete

    event :address do
      transitions from: :in_cart, to: :address
    end

    event :delivery do
      transitions from: :address, to: :delivery
    end

    event :payment do
      transitions from: :delivery, to: :payment
    end

    event :confirm do
      transitions from: :payment, to: :confirm
    end

    event :complete do
      transitions from: :confirm, to: :complete
    end
  end
end
