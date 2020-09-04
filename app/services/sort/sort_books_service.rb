module Sort
  class SortBooksService
    SORT_BY = %w[name_a_z name_z_a newest_first popular_first price_low price_hight].freeze

    def initialize(books, sort_by)
      @books = books
      @sort_by = sort_by
    end

    attr_reader :books, :sort_by

    def call
      sort_books
    end

    private

    def sort_books
      SORT_BY.include?(sort_by) ? books.public_send(sort_by) : books.name_a_z
    end
  end
end
