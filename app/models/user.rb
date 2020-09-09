class User < ApplicationRecord
  PASSWORD_FORMAT = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/.freeze
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: PASSWORD_FORMAT }

  before_validation :strip_password

  def strip_password
    self.password = password.strip
    self.password_confirmation = password_confirmation.strip
  end
end
