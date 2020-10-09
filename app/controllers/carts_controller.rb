class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @books = current_order&.books&.includes([:category])
    @current_order = current_order
  end

  def calc_order
    respond_to do |format|
      format.json do
        render json: Calculators::OrderCalculatorService.new(params: params).call, status: :ok
      end
      format.html
    end
  end
end
