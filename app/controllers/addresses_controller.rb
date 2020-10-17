class AddressesController < ApplicationController
  before_action :address_form, only: %i[create update]

  def create
    @addresses = Settings::AddressesService.new(params, current_user, current_order)
    if @address_form.create
      redirect_to(settings_path, notice: I18n.t('settings.new.updated', type: @address_form.address_type.capitalize))
    else
      @email_form = EmailForm.new
      @password_form = PasswordForm.new
      @addresses.address_type(@address_form, address_params)
      render template: 'settings/index'
    end
  end

  def update
    @addresses = Settings::AddressesService.new(params, current_user, current_order)
    if @address_form.update
      redirect_to(settings_path, notice: I18n.t('settings.new.updated', type: @address_form.address_type.capitalize))
    else
      @email_form = EmailForm.new
      @password_form = PasswordForm.new
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
