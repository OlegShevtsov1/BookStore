class EmailFormValidator < ActiveModel::Validator
  attr_reader :email

  def validate(record)
    @email = record.email
    record.errors[:email] << I18n.t('validate.email.email_already_used', email: email) if used_email?
  end

  private

  def used_email?
    User.find_by(email: email)
  end
end
