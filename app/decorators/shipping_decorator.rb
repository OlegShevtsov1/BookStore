class ShippingDecorator < Draper::Decorator
  delegate_all

  def shipping_period
    "#{object.from_days} to #{object.to_days}"
  end

  def price
    "#{I18n.t('EUR')} #{format('%<offset>.2f', offset: object.price)}"
  end

  def shipping_method?(current_order)
    shipping_exist?(current_order) || default_shipping
  end

  private

  def shipping_exist?(current_order)
    current_order.shipping_id == object.id
  end

  def default_shipping
    object.id == Shipping.first.id
  end
end
