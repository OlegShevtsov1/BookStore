class AddressForm
  include ActiveModel::Model
  include Virtus.model

  VALIDATE_CITY = /[A-Z]/.freeze
  VALIDATE_PHONE = /\A^\+[0-9]+\z/.freeze
  VALIDATE_ZIP = /\A[0-9]+\z/.freeze
  VALIDATE_ADDRESS = /\A[a-z A-Z,-]+\z/.freeze

  attribute :first_name, String
  attribute :last_name, String
  attribute :address, String
  attribute :city, String
  attribute :zip, Integer
  attribute :country, String
  attribute :phone, String

  attribute :address_type, String

  attribute :user_id, Integer

  validates :first_name, :last_name, :address, :city, :zip, :country, :phone, :address_type, presence: true
  validates :first_name, :last_name, :address, :city, length: { maximum: 30 }
  validates :first_name, :last_name, :city, format: { with: VALIDATE_CITY, message: I18n.t('validate.big_letter') }
  validates :zip, length: { maximum: 10 }, format: { with: VALIDATE_ZIP, message: I18n.t('validate.wrong_number') }
  validates :phone, length: { minimum: 10, maximum: 15 },
                    format: { with: VALIDATE_PHONE, message: I18n.t('validate.start_plus') }

  def update(params)
    Address.where(address_type: address_type).find_by(user_id: user_id).update(params) if valid?
  end

  def find_or_create_by(address_type, current_user)
    Address.find_or_create_by(address_type: address_type, user_id: current_user.id)
  end
end
