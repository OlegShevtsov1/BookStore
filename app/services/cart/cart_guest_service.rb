module Cart
  class CartGuestService
    def initialize(current_user)
      @current_user = current_user
    end

    def call
      @current_user ? current_user_order : guest_order
    end

    private

    def current_user_order
      order = Order.find_by(user_id: @current_user&.id)
      order_guest = Order.find_by(user_id: nil)
      order.items = order_guest.items if order_guest
      order.save
      order.id
    end

    def guest_order
      order = Order.find_by(user_id: @current_user&.id)
      order&.destroy
      order&.id
    end
  end
end
