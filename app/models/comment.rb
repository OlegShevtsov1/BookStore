class Comment < ApplicationRecord
  TITLE_MAX_SIZE = 80
  REVIEW_MAX_SIZE = 500

  belongs_to :user
  belongs_to :book
  enum status: { unprocessed: 0, approved: 1, rejected: 2 }

  validates :title, :review, presence: true
  validates :title, length: { maximum: TITLE_MAX_SIZE,
                              message: I18n.t('validate.comment.wrong_size', size: TITLE_MAX_SIZE) }
  validates :review, length: { maximum: REVIEW_MAX_SIZE,
                               message: I18n.t('validate.comment.wrong_size', size: REVIEW_MAX_SIZE) }
end
