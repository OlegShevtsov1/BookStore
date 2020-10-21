module Cart
  class ItemCreateService
    attr_reader :order, :item_form, :params, :current_user

    def initialize(current_user, params_request, params)
      @current_user = current_user
      @item_form = ItemForm.new(params_request)
      @params = params
    end

    def call(current_order)
      @order = current_order || Order.create(user: current_user, status: 0)
      create_item
    end

    def create_item
      existed_item ? increment_item(@existed_item) : save_item
    end

    def existed_item
      @existed_item = order.items.find_by(book_id: params[:current_item].to_i)
    end

    def increment_item(cart)
      quantity = cart.quantity + params[:quantity].to_i
      cart.update(quantity: quantity)
    end

    def save_item
      create_cart if item_form.valid?
    end

    private

    def create_cart
      order.items.create(book_id: item_form.current_item, quantity: item_form.quantity)
    end
  end
end
