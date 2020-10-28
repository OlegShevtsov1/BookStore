class Book < ApplicationRecord
  MIN_DESCRIPTION_SIZE = 50
  include ImageUploader::Attachment(:image)

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :items, dependent: :destroy
  has_many :orders, through: :items
  has_many :comments, dependent: :destroy
  has_many :book_images, dependent: :destroy
  accepts_nested_attributes_for :book_images, allow_destroy: true
  belongs_to :category
  validates :name, presence: true
  validates :description, length: { minimum: MIN_DESCRIPTION_SIZE }

  scope :newest_first, -> { order(id: :desc) }
  scope :popular_first, -> { order(id: :desc) }
  scope :price_low, -> { order(price: :desc) }
  scope :price_hight, -> { order(:price) }
  scope :name_a_z, -> { order(:name) }
  scope :name_z_a, -> { order(name: :desc) }
end
