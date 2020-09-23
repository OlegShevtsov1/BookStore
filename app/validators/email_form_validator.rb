class EmailFormValidator < ActiveModel::Validator
  EMAIL_FORMAT = /\A[^@\s]+@[^@\s]+\z/.freeze
  CORRECT_FORMAT_EXAMPLE = 'example@gmail.com'.freeze
  attr_reader :email

  def validate(record)
    @email = record.email
    record.errors[:email] << I18n.t('validate.email.email_already_used', email: email) if used_email?

    return if email.match?(EMAIL_FORMAT)

    record.errors[:email] << I18n.t('devise.wrong_format', format_example: CORRECT_FORMAT_EXAMPLE)
  end

  private

  def used_email?
    User.find_by(email: email)
  end
end
