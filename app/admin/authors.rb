ActiveAdmin.register Author do
  permit_params :name, :description

  index do
    selectable_column
    column :first_name
    column :last_name
    column :description
    actions
  end

  filter :books
  filter :first_name
  filter :last_name
  filter :created_at
  filter :updated_at
end
