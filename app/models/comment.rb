class Comment < ApplicationRecord
  TITLE_MAX_SIZE = 80
  REVIEW_MAX_SIZE = 500

  VALIDATE_TITLE = %r{[A-Za-z0-9 -! -# -$ -% -& -' - *-+ -/ -= -? -_ -` -{ -} -~ -. -^]}.freeze
  VALIDATE_REVIEW = %r{[A-Za-z0-9 -! -# -$ -% -& -' - *-+ -/ -= -? -_ -` -{ -} -~ -. -^]}.freeze

  belongs_to :user
  belongs_to :book
  enum status: { unprocessed: 0, approved: 1, rejected: 2 }

  validates :title, :review, presence: true
  validates :title, length: { maximum: TITLE_MAX_SIZE,
                              message: I18n.t('validate.comment.wrong_size', size: TITLE_MAX_SIZE) },
                    format: { with: VALIDATE_TITLE,
                              message: I18n.t('validate.comment.comment_format') }

  validates :review, length: { maximum: REVIEW_MAX_SIZE,
                               message: I18n.t('validate.comment.wrong_size', size: REVIEW_MAX_SIZE) },
                     format: { with: VALIDATE_TITLE,
                               message: I18n.t('validate.comment.comment_format') }
end
