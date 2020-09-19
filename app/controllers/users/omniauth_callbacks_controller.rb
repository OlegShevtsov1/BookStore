module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    AUTH_KIND = 'Facebook'.freeze

    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      else
        session['devise.facebook_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end

    private

    def sign_in_user(user)
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: AUTH_KIND) if is_navigational_format?
    end
  end
end
