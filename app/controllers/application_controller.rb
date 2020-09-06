class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :categories

  def categories
    @categories = Category.all
  end
end
