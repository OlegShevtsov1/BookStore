class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @addresses = Settings::AddressesService.new(current_user)
    @email_form = EmailForm.new
    @password_form = PasswordForm.new
  end
end
