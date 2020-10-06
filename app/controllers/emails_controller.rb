class EmailsController < ApplicationController
  before_action :email_form

  def update
    if @email_form.update
      redirect_to settings_path, notice: I18n.t('settings.new.email_updated', email: @email_form.email)
    else
      redirect_to settings_path, alert: @email_form.errors.full_messages.to_sentence
    end
  end

  private

  def email_form
    @email_form = EmailForm.new(email_params)
  end

  def email_params
    params.require(:email).permit(:email, :user_id)
  end
end
