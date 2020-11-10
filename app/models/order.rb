class Order < ApplicationRecord
  include AASM

  has_many :items, dependent: :destroy
  has_many :books, through: :items
  belongs_to :coupon, optional: true
  belongs_to :user, optional: true
  belongs_to :shipping, optional: true
  has_one :credit_card, dependent: :destroy

  enum status: { in_cart: 0, address: 1, choose_delivery: 2, pay: 3, confirmation: 4, completed: 5 }

  aasm :status, enum: true do
    state :in_cart, initial: true
    state :address
    state :choose_delivery
    state :pay
    state :confirmation
    state :completed

    event :address do
      transitions from: :in_cart, to: :address
    end

    event :delivery do
      transitions from: :address, to: :choose_delivery
    end

    event :pay do
      transitions from: :choose_delivery, to: :pay
    end

    event :confirmation do
      transitions from: :pay, to: :confirmation
    end

    event :completed do
      transitions from: :confirmation, to: :completed
    end
  end
end
