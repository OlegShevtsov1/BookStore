class EmailForm
  include ActiveModel::Model
  include Virtus.model

  attribute :email, String

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_with EmailValidator, EmailFormValidator

  def update(current_user)
    current_user.update(email: email) if valid?
  end
end
