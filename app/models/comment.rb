class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum status: { unprocessed: 0, approved: 1, rejected: 2 }

  validates :title, :review, presence: true
end
