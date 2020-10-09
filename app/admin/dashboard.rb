ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        div I18n.t('admin.dashboard.users_count', count: User.count)
        div I18n.t('admin.dashboard.authors_count', count: Author.count)
        div I18n.t('admin.dashboard.categories_count', count: Category.count)
        div I18n.t('admin.dashboard.books_count', count: Book.count)
        div I18n.t('admin.dashboard.comment_count', count: Comment.count)
      end
    end
  end
end
