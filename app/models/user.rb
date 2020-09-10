class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates_with PasswordValidator

  before_validation :strip_password

  def strip_password
    self.password = password.strip
    self.password_confirmation = password_confirmation.strip
  end
end
