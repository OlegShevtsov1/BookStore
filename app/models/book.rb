class Book < ApplicationRecord
  MIN_DESCRIPTION_SIZE = 50
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors, dependent: :destroy
  belongs_to :category
  validates :name, presence: true
  validates :description, length: { minimum: MIN_DESCRIPTION_SIZE }
end
