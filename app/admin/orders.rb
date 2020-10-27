ActiveAdmin.register Order do
  permit_params :user_id, :code, :status, :shipping_id, :price
  includes :user, :shipping

  filter :price
  filter :code
  filter :books

  actions :update, :index, :destroy
  scope :complete, default: true
  scope :in_delivery
  scope :delivered
  scope :canceled

  index do
    selectable_column
    column :code
    column :status
    column :shipping
    column :user
    column :created_at
    column t('admin.orders.completed_at_column'), :updated_at

    actions dropdown: true, defaults: false do |order|
      if order.may_in_delivery?
        item(t('admin.orders.in_delivery_status'),
             admin_order_path(id: order.id, status: :in_delivery), method: :put)
      end
      if order.may_delivered?
        item(t('admin.orders.delivered_status'),
             admin_order_path(id: order.id, status: :delivered), method: :put)
      end
      if order.may_canceled?
        item(t('admin.orders.canceled_status'),
             admin_order_path(id: order.id, status: :canceled), method: :put)
      end
    end
  end

  controller do
    def update
      order = Order.find(params[:id])
      updating_result = order.update(status: params[:status])
      if updating_result
        redirect_to admin_orders_path(scope: params[:status]), notice: t('admin.orders.order_updated')
      else
        redirect_to admin_orders_path(order), alert: t('admin.orders.order_updating_fail')
      end
    end
  end
end
