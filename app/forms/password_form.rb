class PasswordForm
  MIN_PASSWORD_SIZE = 8

  include ActiveModel::Model
  include Virtus.model

  attribute :old_password, String
  attribute :password, String
  attribute :confirm_password, String
  attribute :user_id, Integer

  validates :old_password, :password, :confirm_password, presence: true
  validates :password, length: { minimum: MIN_PASSWORD_SIZE }
  validates_with PasswordValidator, PasswordFormValidator

  def update(current_user)
    current_user.reset_password(password, confirm_password) if valid?
  end
end
