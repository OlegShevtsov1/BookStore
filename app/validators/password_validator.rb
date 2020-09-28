class PasswordValidator < ActiveModel::Validator
  PASSWORD_FORMAT = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/.freeze
  attr_reader :password

  def validate(record)
    @password = record.password
    record.errors[:password].push invalid_password_format
    record.errors[:password].compact!
  end

  private

  def invalid_password_format
    I18n.t('devise.password_validate') unless password.match?(PASSWORD_FORMAT)
  end
end
