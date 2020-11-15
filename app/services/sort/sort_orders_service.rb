module Sort
  class SortOrdersService
    SORT_BY = %w[waiting_for_processing in_delivery delivered canceled].freeze

    attr_reader :orders, :sort_by

    def initialize(orders, sort_by)
      @orders = orders
      @sort_by = sort_by
    end

    def call
      SORT_BY.include?(sort_by) ? orders.public_send(sort_by) : orders.waiting_for_processing
    end
  end
end
