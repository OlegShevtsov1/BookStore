class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates_with PasswordValidator
  validates_with EmailValidator

  before_validation :strip_password
  validates :email, presence: true

  def strip_password
    self.password = password.strip
    self.password_confirmation = password_confirmation.strip
  end
end
