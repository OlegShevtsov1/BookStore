class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Sort::SortOrdersService.new(Order.all, params['sort_by']).call
  end

  def show
    authorize order
    @addresses = Settings::SettingsIndexService.new(current_user)
  end

  private

  def order
    @order ||= Order.find(params[:id])
  end
end
