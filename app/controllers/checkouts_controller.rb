class CheckoutsController < ApplicationController
  def show
    @service = Checkout::CheckoutShowService.new(params, current_user, current_order)
  end

  def update
    service = Checkout::CheckoutUpdateService.new(params, current_user, current_order)
    if service.call
      redirect_to checkouts_path
    else
      @service = Checkout::CheckoutShowService.new(params, current_user, current_order).call(service.current_service)
      render :show
    end
  end
end
