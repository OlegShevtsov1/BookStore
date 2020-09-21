ActiveAdmin.register Category, as: 'All Categories' do
  permit_params :name

  index do
    selectable_column
    column :name

    actions
  end
end
