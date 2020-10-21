class CheckoutsController < ApplicationController
  def show
    @service = Checkout::CheckoutShowService.new(params, current_user, current_order, nil)
  end

  def update
    update_service = Checkout::CheckoutUpdateService.new(params, current_user, current_order)
    if update_service.call
      redirect_to checkouts_path(step: update_service.next_step)
    else
      @service = Checkout::CheckoutShowService.new(params, current_user, current_order, update_service.current_service)
      render :show
    end
  end
end
