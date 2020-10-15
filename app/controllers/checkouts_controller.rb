class CheckoutsController < ApplicationController
  def show
    @step = params[:step]
  end
end
