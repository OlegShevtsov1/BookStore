module Sort
  class TopBooksService
    COUNT_TOP_BOOKS = 4

    def call
      top_books = Book.joins(:orders).group(:id).count.sort_by { |_, value| -value }.first(COUNT_TOP_BOOKS)
      top_books.map { |book| Book.find_by(id: book.first) }
    end
  end
end
