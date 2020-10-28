module Cart
  class ItemDeleteService
    attr_reader :current_order, :params

    def initialize(current_order, params)
      @current_order = current_order
      @params = params
    end

    def call
      delete_item
    end

    def delete_order?
      current_order.destroy if empty_order?
    end

    def delete_item
      current_order.items.find_by(book_id: params[:id].to_i).delete
    end

    def empty_order?
      current_order.items.empty?
    end
  end
end
