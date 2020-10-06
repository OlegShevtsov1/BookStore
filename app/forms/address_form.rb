class AddressForm
  include ActiveModel::Model

  TEXT_MAX_SIZE = 50
  ZIP_MAX_SIZE = 10
  PHONE_MAX_SIZE = 15

  VALIDATE_CITY = /[A-Z]/.freeze
  VALIDATE_PHONE = /\A^\+[0-9]+\z/.freeze
  VALIDATE_ZIP = /\A[0-9]+\z/.freeze
  VALIDATE_NAME = /\d/.freeze
  VALIDATE_ADDRESS = /[A-Za-z0-9-]/.freeze

  attr_accessor :first_name, :last_name, :address, :city, :zip, :country, :phone, :address_type, :user_id

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

  def update
    return unless valid?

    Address.find_by(address_type: address_type, user_id: user_id).update(address_params)
  end

  def create
    return unless valid?

    user.addresses.create(address_params)
  end

  def user
    User.find(user_id)
  end

  def address_params
    { first_name: first_name, last_name: last_name, address: address, country: country, city: city, zip: zip,
      phone: phone, address_type: address_type }
  end
end
