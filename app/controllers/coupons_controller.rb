class CouponsController < ApplicationController
  def update
    authorize coupon
    return redirect_to carts_path, alert: I18n.t('controllers.wrong_coupon') unless coupon
    return redirect_to carts_path, alert: I18n.t('controllers.used_coupon') if coupon_used?

    redirect_to carts_path, notice: I18n.t('controllers.applied_coupon') if current_order.update(coupon: coupon)
  end

  private

  def coupon_used?
    coupon.order.present?
  end

  def coupon
    @coupon ||= Coupon.find_by(code: params[:coupon_code])
  end
end
