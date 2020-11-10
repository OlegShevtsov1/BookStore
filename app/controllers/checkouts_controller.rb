class CheckoutsController < ApplicationController
  def show
    @service = Checkout::CheckoutShowService.new(params, current_user, current_order)
    authorize @service
  end

  def update
    update_service = Checkout::CheckoutUpdateService.new(params, current_user, current_order)
    if update_service.call
      redirect_to checkouts_path
    else
      @service = Checkout::CheckoutShowService.new(params, current_user, current_order)
                                              .call(update_service.current_service)
      render :show
    end
  end
end
