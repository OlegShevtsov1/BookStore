class HomesController < ApplicationController
  COUNT_LAST_BOOKS = 3
  def index
    @books_slider = policy_scope(Book).includes(:authors).last(COUNT_LAST_BOOKS)
    @best_sellers = Sort::TopBooksService.new(policy_scope(Book)).call
  end
end
