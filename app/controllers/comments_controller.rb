class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :book

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    if @comment.save
      redirect_to category_book_path(@book.category, @book), notice: I18n.t('books.comment.success')
    else
      redirect_to category_book_path(@book.category, @book), alert: @comment.errors.full_messages.to_sentence
    end
  end

  private

  def book
    @book ||= Book.find(comment_params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :review, :user_id, :book_id, :score).merge(user_id: current_user.id)
  end
end
