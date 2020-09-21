class PasswordFormValidator < ActiveModel::Validator
  attr_reader :user_id, :old_password

  def validate(record)
    @user_id = record.user_id
    @old_password = password
    check_old_password(record)
    check_confirmation(record)
  end

  private

  def check_confirmation(record)
    return unless record.confirm_password != record.password

    record.errors[:confirm_password] << I18n.t('validate.passwd.check_confirm_password')
  end

  def check_old_password(record)
    record.errors[:old_password] << I18n.t('validate.passwd.check_old_password') if old_password != record.old_password
  end

  def password
    BCrypt::Password.new(User.find(user_id).encrypted_password)
  end
end
