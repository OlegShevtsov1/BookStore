class EmailForm
  include ActiveModel::Model
  attr_accessor :email, :user_id

  validates :email, presence: true
  validates_with EmailValidator, EmailFormValidator

  def current_user
    User.find(user_id)
  end

  def update
    current_user.update(email: email) if valid?
  end
end
