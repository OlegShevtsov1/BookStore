class AccountsController < ApplicationController
  before_action :password_form, only: :update

  def destroy
    redirect_to settings_path, alert: I18n.t('settings.new.account_removed_confirm') if params[:remove_account].blank?

    if current_user&.destroy
      cookies.delete(:current_order_id)
      redirect_to root_path, notice: I18n.t('settings.new.account_removed')
    else
      redirect_to root_path, alert: I18n.t('settings.new.account_removed_error')
    end
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
