class CommentDecorator < Draper::Decorator
  DATE_FORMAT = '%Y-%m-%d %H:%M'.freeze
  DEFAULT_USER_NAME = 'user'.freeze
  MIN_SCORE = 1
  MAX_SCORE = 5

  delegate_all

  def comment_date
    object.created_at.strftime(DATE_FORMAT)
  end

  def user_name
    address = object.user.addresses.billing.first
    return DEFAULT_USER_NAME unless address

    "#{address.first_name} #{address.last_name}"
  end

  def empty_stars_count
    MAX_SCORE - object.score
  end

  def verified_reviewer
    I18n.t('books.show.review.verified_reviewer')
  end
end
