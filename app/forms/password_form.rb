class PasswordForm
  MIN_PASSWORD_SIZE = 8

  include ActiveModel::Model
  attr_accessor :old_password, :password, :confirm_password, :user_id

  validates :old_password, :password, :confirm_password, presence: true
  validates :password, length: { minimum: MIN_PASSWORD_SIZE }
  validates_with PasswordValidator, PasswordFormValidator

  def current_user
    User.find(user_id)
  end

  def update
    current_user.reset_password(password, confirm_password) if valid?
  end
end
