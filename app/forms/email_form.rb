class EmailForm
  include ActiveModel::Model
  attr_accessor :email

  validates :email, presence: true
  validates_with EmailValidator, EmailFormValidator

  def update(current_user)
    current_user.update(email: email) if valid?
  end
end
