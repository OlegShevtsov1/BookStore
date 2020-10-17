class CheckoutsController < ApplicationController
  def show
    @service = Checkout::CheckoutShowService.new(params, current_user, current_order, nil)
  end

  def update
    service = Checkout::CheckoutUpdateService.new(params, current_user, current_order)

    if service.call
      redirect_to checkouts_path(step: service.next_step)
    else
      @service = Checkout::CheckoutShowService.new(params, current_user, current_order, service)
      render :show
    end
  end
end
