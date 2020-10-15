module Users
  class RegistrationsController < Devise::RegistrationsController
    TOKEN_SIZE = 25
    before_action only: :create

    def create
      return checkout_quick_register if quick_register?

      super
    end

    def checkout_quick_register
      return email_error unless email_form.valid?

      secret_password_token
      build_resource(sign_up_params)
      resource.skip_confirmation!
      resource.save ? authenticate_user : redirect_to(user_session_path, notice: 'email exists')
    end

    def authenticate_user
      sign_up(resource_name, resource)
      resource.send_reset_password_instructions
      redirect_to carts_path
    end

    private

    def secret_password_token
      params[:user][:password] = params[:user][:password_confirmation] = Devise.friendly_token[0, TOKEN_SIZE]
    end

    def quick_register?
      params[:quick_register] && !User.find_by(email: params[:user][:email])
    end

    def email_error
      redirect_to checkout_path, alert: email_form.errors[:email].to_sentence
    end

    def email_form
      EmailForm.new(user_params)
    end

    def user_params
      params.require(:user).permit(:email)
    end
  end
end