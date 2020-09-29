module Cart
  class ItemCreateService
    attr_reader :order, :item_form, :params, :current_user

    def initialize(current_user, params_request, params)
      @current_user = current_user
      @item_form = ItemForm.new(params_request)
      @params = params
    end

    def call(current_order)
      @order = current_order || Order.create
      create_item
    end

    def create_item
      exist_item ? increment_item(exist_item) : save_item
    end

    def exist_item
      order.items.find_by(book_id: params[:current_item].to_i)
    end

    def increment_item(cart)
      cart.quantity += params[:quantity].to_i
      cart.save
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
