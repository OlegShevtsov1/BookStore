class AddressesController < ApplicationController
  before_action :address_form, only: :create

  def create
    @addresses = Settings::AddressesService.new(current_user)
    @email_form = EmailForm.new
    @password_form = PasswordForm.new
    if @address_form.update
      redirect_to(settings_path, notice: I18n.t('settings.new.updated', type: @address_form.address_type.capitalize))
    else
      @addresses.address_type(@address_form, address_params)
      render template: 'settings/index'
    end
  end

  private

  def address_form
    @address_form = AddressForm.new(address_params)
  end

  def address_params
    params.require(:address_form).permit(:first_name,
                                         :last_name,
                                         :address,
                                         :city,
                                         :country,
                                         :zip,
                                         :phone,
                                         :user_id,
                                         :address_type)
  end
end
