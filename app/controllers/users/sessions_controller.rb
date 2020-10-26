module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      service = Cart::CartGuestService.new(current_user)
      session[:current_order_id] = service.call
    end

    def destroy
      super
      service = Cart::CartGuestService.new(nil)
      session[:current_order_id] = service.call
    end
  end
end
