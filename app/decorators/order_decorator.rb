class OrderDecorator < Draper::Decorator
  FIRST_PRICE = 0.0
  delegate_all

  def subtotal_price
    "#{I18n.t('EUR')}#{format('%<offset>.2f', offset: subtotal_items_price)}"
  end

  def coupon_price
    "#{I18n.t('EUR')} #{format('%<offset>.2f', offset: coupon_discount)}"
  end

  def order_total_price
    "#{I18n.t('EUR')} #{format('%<offset>.2f', offset: order_total_price_with_coupon)}"
  end

  def count_books(book)
    object.items.find_by(book: book).quantity
  end

  def subtotal_books_price(book)
    format('%<offset>.2f', offset: subtotal_items_book_price(book))
  end

  private

  def subtotal_items_book_price(book)
    book.price * count_books(book)
  end

  def subtotal_items_price
    object.items.sum { |item| item.quantity * item.book.price }
  end

  def order_total_price_with_coupon
    subtotal_items_price - coupon_discount
  end

  def coupon_discount
    object.coupon ? object.coupon.discount : FIRST_PRICE
  end
end
