module Sort
  class TopBooksService
    COUNT_TOP_BOOKS = 4

    attr_reader :book_object

    def initialize(book_object)
      @book_object = book_object
    end

    def call
      top_books = book_object.joins(:orders).group(:id).count.sort_by { |_, value| -value }.first(COUNT_TOP_BOOKS)
      top_books.map { |book| book_object.find_by(id: book.first) }
    end
  end
end
