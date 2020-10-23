class Shipping < ApplicationRecord
  has_many :orders, dependent: :nullify
  validates :name, :price, :to_days, :from_days, presence: true
  validates :to_days, :from_days, numericality: { only_integer: true, greater_than: 0 }
end
