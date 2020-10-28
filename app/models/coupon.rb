class Coupon < ApplicationRecord
  has_one :order, dependent: :nullify
  validates :code, presence: true
end
