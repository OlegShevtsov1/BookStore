class BookPresenter
  DESCRIPTION_LIMIT = 250
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def authors
    book.authors.map(&:name).join ', '
  end

  def properties
    "H:#{book.heigth}\" x W: #{book.width}\" x D: #{book.depth}"
  end

  def short_description
    book.description[0..DESCRIPTION_LIMIT]
  end

  def description_length_valid?
    book.description.length > DESCRIPTION_LIMIT
  end
end
