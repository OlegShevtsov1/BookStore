class Order < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :books, through: :items
  belongs_to :coupon, optional: true
  belongs_to :user, optional: true
end
