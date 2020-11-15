class OrderDecorator < Draper::Decorator
  include ActiveSupport::NumberHelper
  FIRST_PRICE = 0.0
  DATE_FORMAT = '%B %d, %Y'.freeze

  delegate_all

  def subtotal_price
    number_to_currency(subtotal_items_price, unit: I18n.t('EUR'))
  end

  def coupon_price
    number_to_currency(coupon_discount, unit: I18n.t('EUR'))
  end

  def shipping_price
    number_to_currency(define_shipping_price, unit: I18n.t('EUR'))
  end

  def order_total_price
    number_to_currency(order_total_price_with_coupon, unit: I18n.t('EUR'))
  end

  def count_books(book)
    object.items.find_by(book: book).quantity
  end

  def subtotal_books_price(book)
    format('%<offset>.2f', offset: subtotal_items_book_price(book))
  end

  def created_at
    object.created_at.strftime(DATE_FORMAT)
  end

  def code
    "Order ##{object.code}"
  end

  def status
    object.status.capitalize
  end

  private

  def subtotal_items_book_price(book)
    book.price * count_books(book)
  end

  def subtotal_items_price
    object.items.includes([:book]).sum { |item| item.quantity * item.book.price }
  end

  def order_total_price_with_coupon
    subtotal_items_price + define_shipping_price - coupon_discount
  end

  def coupon_discount
    object.coupon ? object.coupon.discount : FIRST_PRICE
  end

  def define_shipping_price
    object.shipping ? object.shipping.price : FIRST_PRICE
  end
end
