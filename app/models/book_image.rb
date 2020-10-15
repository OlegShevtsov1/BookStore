class BookImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :book
end
