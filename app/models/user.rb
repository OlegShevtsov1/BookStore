class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  validates_with PasswordValidator
  validates_with EmailValidator

  before_validation :strip_password
  validates :email, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.skip_confirmation!
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def strip_password
    self.password = password.strip
    self.password_confirmation = password_confirmation.strip
  end
end
