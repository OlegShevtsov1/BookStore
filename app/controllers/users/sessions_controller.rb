module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      ord = Order.find_by(user_id: current_user.id)
      session[:current_order_id] = ord&.id
    end

    def destroy
      super
      ord = Order.find_by(user_id: nil)
      session[:current_order_id] = ord&.id
    end
  end
end
