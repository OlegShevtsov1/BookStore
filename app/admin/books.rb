ActiveAdmin.register Book do
  includes :category, :book_authors, :authors
  permit_params :name, :description, :price, :material, :year, :heigth, :width, :depth, :category_id,
                book_images_attributes: %i[id book_id image], author_ids: []

  index do
    selectable_column

    column :book_image do |book|
      if book.book_images.includes([:book_images]).any?
        image_tag book.book_images.includes([:book_images]).first.image_url, class: 'admin-image-book'
      else
        image_tag 'active_admin/default.png', class: 'admin-image-book'
      end
    end

    column :category
    column :authors

    column :name do |book|
      link_to book.name, resource_path(book)
    end

    column :short_description do |book|
      "#{book.description[0..20]}..."
    end

    column :price do |book|
      I18n.t('admin.book.price', price: book.price)
    end

    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price do |book|
        I18n.t('admin.book.price', price: book.price)
      end

      row :authors
      row :category
      row :year
      row :material
      row :heigth
      row :width
      row :depth

      row :book_cover do |book|
        if book.book_images.includes([:book_images]).any?
          image_tag book.book_images.includes([:book_images]).first.image_url, class: 'admin-image-book'
        else
          image_tag 'active_admin/default.png', class: 'admin-image-book'
        end
      end
    end
  end

  filter :name
  filter :authors
  filter :category
  filter :description
  filter :price
  filter :width
  filter :heigth
  filter :material
  filter :depth
  filter :created_at
  filter :updated_at

  form html: { multipart: true }, name: I18n.t('admin.book.new') do |f|
    f.inputs do
      f.input :name
      f.input :category
      f.input :authors, as: :check_boxes
      f.input :description
      f.input :price
      f.input :year
      f.input :material
      f.input :heigth
      f.input :width
      f.input :depth

      f.fields_for :book_images do |img|
        img.file_field :image, multiple: true, name: 'book_images[image][]'
      end
    end
    actions
  end
end
