class Shipping < ApplicationRecord
  has_many :orders, dependent: :nullify
end
