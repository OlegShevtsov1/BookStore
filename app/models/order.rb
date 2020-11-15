class Order < ApplicationRecord
  include AASM

  has_many :items, dependent: :destroy
  has_many :books, through: :items
  belongs_to :coupon, optional: true
  belongs_to :user, optional: true
  belongs_to :shipping, optional: true
  has_one :credit_card, dependent: :destroy

  enum status: { in_cart: 0, address: 1, choosing_delivery: 2, payment: 3, confirmation: 4, completed: 5,
                 in_delivery: 6, delivered: 7, canceled: 8 }

  scope :waiting_for_processing, -> { where(status: :completed) }
  scope :in_delivery, -> { where(status: :in_delivery) }
  scope :delivered, -> { where(status: :delivered) }
  scope :canceled, -> { where(status: :canceled) }

  aasm :status, enum: true do
    state :in_cart, initial: true
    state :address
    state :choosing_delivery
    state :payment
    state :confirmation
    state :completed

    event :address do
      transitions from: :in_cart, to: :address
    end

    event :choose_delivery do
      transitions from: :address, to: :choosing_delivery
    end

    event :pay do
      transitions from: :choosing_delivery, to: :payment
    end

    event :confirm do
      transitions from: :payment, to: :confirmation
    end

    event :complete do
      transitions from: :confirmation, to: :completed
    end

    event :start_delivery do
      transitions from: :completed, to: :in_delivery
    end

    event :end_delivery do
      transitions from: :in_delivery, to: :delivered
    end

    event :cancel do
      transitions from: %i[complete in_delivery delivered], to: :canceled
    end
  end
end
