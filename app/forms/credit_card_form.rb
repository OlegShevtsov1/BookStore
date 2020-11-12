class CreditCardForm
  include ActiveModel::Model

  CARD_NUMBER_SIZE = 16
  CVV_MIN_SIZE = 3
  CVV_MAX_SIZE = 4
  NAME_MAX_SIZE = 50
  NAME_FORMAT = /\A[a-zA-Z ]*\z/.freeze
  DATE_FORMAT = %r{\A^(0[1-9]|1[0-2])/?([0-9]{2})$\z}.freeze

  attr_accessor :name, :number, :date, :cvv, :order_id

  validates :name, :number, :date, :cvv, :order_id, presence: true
  validates :name, length: { maximum: NAME_MAX_SIZE }, format: { with: NAME_FORMAT }
  validates :number, length: { is: CARD_NUMBER_SIZE,
                               message: I18n.t('validate.credit_card.invalid_credit_card', size: CARD_NUMBER_SIZE) },
                     numericality: { only_integer: true }
  validates :cvv, numericality: { only_integer: true }, length: { minimum: CVV_MIN_SIZE, maximum: CVV_MAX_SIZE }
  validates :date, format: { with: DATE_FORMAT }

  def create
    return unless valid?

    CreditCard.create(params)
  end

  def update
    return unless valid?

    order.credit_card.update(params)
  end

  private

  def order
    Order.find(order_id)
  end

  def params
    { name: name, number: number, date: date, cvv: cvv, order_id: order_id }
  end
end
