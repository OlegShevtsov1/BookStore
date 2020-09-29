class ItemsController < ApplicationController
  def create
    service = Cart::ItemCreateService.new(current_user, item_params, params)
    service.call(current_order)
    session[:current_order_id] = service.order.id unless current_order
    redirect_message(I18n.t('controllers.added_in_cart'), :notice)
  end

  private

  def redirect_message(message, type)
    redirect_back(fallback_location: root_path)
    flash[type] = message
  end

  def item_params
    params.permit(:current_item, :current_user, :quantity)
  end
end
