class BooksPresenter
  BOOKS_COUNT_ROW = 4
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def books
    Book.includes(%i[authors category]).all
  end

  def categories
    Category.all
  end
end
