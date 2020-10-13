ActiveAdmin.register Book do
  includes :category, :book_authors, :authors

  controller do
    def create
      book = Book.new
      book.assign_attributes(book_controller_params)
      if book.valid?
        book.save
        redirect_to admin_books_path
      else
        @resource = book
        render :new
      end
    end

    def update
      book = Book.find(params[:id])
      if book.valid?
        book.update(book_controller_params)
        redirect_to admin_books_path
      else
        @resource = book
        render :edit
      end
    end

    def book_controller_params
      params[:images].present? ? book_images_params : book_params
    end

    def book_params
      params.require(:book).permit(:name, :description, :price, :material, :year, :heigth, :width, :depth,
                                   :category_id, :image, author_ids: [])
    end

    def book_images_params
      images_attributes = params[:images].inject({}) { |hash, image| hash.merge!(SecureRandom.hex => { image: image }) }
      book_params.merge(book_images_attributes: images_attributes)
    end
  end

  index do
    selectable_column

    column :image do |book|
      if book.image_url.present?
        image_tag book.image_url, class: 'admin-image-book'
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

      row :authors do |book|
        book.decorate.authors
      end
      row :category
      row :year
      row :material
      row :heigth
      row :width
      row :depth

      row :image do |book|
        if book.image_url.present?
          image_tag book.image_url, class: 'admin-image-book'
        else
          image_tag 'active_admin/default.png', class: 'admin-image-book'
        end
      end

      row :book_images do |book|
        table do
          tr do
            book.book_images.each do |book_image|
              td do
                image_tag book_image.image.url, class: 'admin-image-book'
              end
            end
          end
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
      f.input :image, as: :file
      f.input :book_images, as: :file, input_html: { multiple: true, name: 'images[]' }
    end
    actions
  end
end
