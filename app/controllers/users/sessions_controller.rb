module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      order = Order.find_by(user_id: current_user.id)
      session[:current_order_id] = order&.id
    end

    def destroy
      super
      order = Order.find_by(user_id: nil)
      session[:current_order_id] = order&.id
    end
  end
end
