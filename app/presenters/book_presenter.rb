class BookPresenter
  DESCRIPTION_LIMIT = 250
  attr_reader :book

  delegate :name, to: :book
  delegate :price, to: :book
  delegate :description, to: :book
  delegate :year, to: :book
  delegate :material, to: :book
  delegate :id, to: :book

  def initialize(book)
    @book = book
  end

  def authors
    book.authors.decorate.map(&:name).join ', '
  end

  def properties
    "H:#{book.heigth}\" x W: #{book.width}\" x D: #{book.depth}"
  end

  def short_description
    book.description[0..DESCRIPTION_LIMIT]
  end

  def description_length_short?
    book.description.length < DESCRIPTION_LIMIT
  end
end
