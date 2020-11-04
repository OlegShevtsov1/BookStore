class AddressesController < ApplicationController
  def create
    @settings = Settings::SettingsIndexService.new(current_user)
    authorize address_form
    if address_form.create
      redirect_to(settings_path, notice: I18n.t('settings.new.updated', type: address_form.address_type.capitalize))
    else
      @settings.address_type(address_form)
      render template: 'settings/index'
    end
  end

  def update
    @settings = Settings::SettingsIndexService.new(current_user)
    authorize address_form
    if @address_form.update
      redirect_to(settings_path, notice: I18n.t('settings.new.updated', type: address_form.address_type.capitalize))
    else
      @settings.address_type(address_form)
      render template: 'settings/index'
    end
  end

  def address_form
    @address_form = Settings::AddressesService.new(params, current_user, current_order).address_form
  end
end
