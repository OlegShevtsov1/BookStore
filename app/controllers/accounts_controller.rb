class AccountsController < ApplicationController
  before_action :password_form, only: :update

  def destroy
    if current_user&.destroy
      cookies.delete(:current_order_id)
      flash[:success] = I18n.t('controllers.deleted_account')
    else
      flash[:error] = I18n.t('controllers.error_deleted_account')
    end
    redirect_to root_path
  end

  def update
    if @password_form.update(current_user)
      sign_in(current_user, bypass: true)
      redirect_to settings_path, notice: I18n.t('settings.new.password_updated')
    else
      redirect_to settings_path, alert: @password_form.errors.full_messages.to_sentence
    end
  end

  private

  def password_form
    @password_form = PasswordForm.new(password_params)
  end

  def password_params
    params.require(:password).permit(:old_password, :password, :confirm_password, :user_id)
  end
end
