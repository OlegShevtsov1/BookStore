class AddressForm
  include ActiveModel::Model
  include Virtus.model

  TEXT_MAX_SIZE = 50
  ZIP_MAX_SIZE = 10
  PHONE_MAX_SIZE = 15

  VALIDATE_CITY = /[A-Z]/.freeze
  VALIDATE_PHONE = /\A^\+[0-9]+\z/.freeze
  VALIDATE_ZIP = /\A[0-9]+\z/.freeze
  VALIDATE_NAME = /\d/.freeze
  VALIDATE_ADDRESS = /[A-Za-z0-9-]/.freeze

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
  validates :first_name, :last_name, :address, :city,
            length: { maximum: TEXT_MAX_SIZE, message: I18n.t('validate.address.wrong_size', size: TEXT_MAX_SIZE) }
  validates :first_name, :last_name, :city,
            format: { with: VALIDATE_CITY, message: I18n.t('validate.address.big_letter') }
  validates :zip, length: { maximum: ZIP_MAX_SIZE, message: I18n.t('validate.address.wrong_size', size: ZIP_MAX_SIZE) },
                  format: { with: VALIDATE_ZIP, message: I18n.t('validate.address.wrong_number') }
  validates :phone, length: { maximum: PHONE_MAX_SIZE,
                              message: I18n.t('validate.address.wrong_size', size: PHONE_MAX_SIZE) },
                    format: { with: VALIDATE_PHONE, message: I18n.t('validate.address.start_plus') }
  validates :first_name, :last_name, :country, :city, format: { without: VALIDATE_NAME,
                                                                message: I18n.t('validate.address.name_format') }
  validates :address, format: { with: VALIDATE_ADDRESS,
                                message: I18n.t('validate.address.address_format') }

  def update(params)
    Address.where(address_type: address_type).find_by(user_id: user_id).update(params) if valid?
  end

  def find_or_create_by(address_type, current_user)
    Address.find_or_create_by(address_type: address_type, user_id: current_user.id)
  end
end
