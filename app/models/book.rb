class Book < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors, dependent: :destroy
  belongs_to :category
end
