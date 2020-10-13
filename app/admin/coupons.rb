ActiveAdmin.register Coupon do
  permit_params :discount, :code

  filter :discount
  filter :created_at
  filter :updated_at

  index do
    selectable_column

    column I18n.t('admin.coupon.code'), :code
    column I18n.t('admin.coupon.discount'), :discount

    actions
  end

  show do
    attributes_table do
      row I18n.t('admin.coupon.code'), &:code
      row I18n.t('admin.coupon.discount'), &:discount
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :code
      f.input :discount
    end
    actions
  end
end
