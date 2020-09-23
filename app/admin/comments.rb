ActiveAdmin.register Comment, as: 'Reviews' do
  # menu false
  permit_params :title, :review, :score, :status, :book_id, :user_id
  includes :book, :user

  scope :unprocessed, default: true
  scope :approved
  scope :rejected

  actions :index, :show, :destroy, :edit

  index do
    selectable_column
    column :book
    column :title
    column :user
    column :status
    column :created_at do |comment|
      comment.created_at.strftime('%Y-%m-%d %H:%M')
    end
    actions
  end

  batch_action 'Approve', if: proc { @current_scope.scope_method == :unprocessed } do |ids|
    comments = Comment.unprocessed.where(id: ids)
    comments.each(&:approved!) if comments.any?
    redirect_to(admin_reviews_path)
  end

  batch_action 'Reject', if: proc { @current_scope.scope_method == :unprocessed } do |ids|
    comments = Comment.unprocessed.where(id: ids)
    comments.each(&:rejected!) if comments.any?
    redirect_to(admin_reviews_path)
  end

  batch_action 'Destroy' do |ids|
    comments = Comment.where(id: ids)
    comments.destroy_all if comments.any?
    redirect_to(admin_reviews_path)
  end
end
