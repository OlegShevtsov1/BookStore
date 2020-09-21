class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  validates :email, presence: true
  validates_with PasswordValidator, EmailValidator, on: :create

  has_many :addresses, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.skip_confirmation!
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
