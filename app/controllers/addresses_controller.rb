class AddressesController < ApplicationController
  before_action :settings

  def create
    if @address_form.create
      redirect_to(settings_path, notice: I18n.t('settings.new.updated', type: @address_form.address_type.capitalize))
    else
      @settings.address_type(@address_form)
      render template: 'settings/index'
    end
  end

  def update
    if @address_form.update
      redirect_to(settings_path, notice: I18n.t('settings.new.updated', type: @address_form.address_type.capitalize))
    else
      @settings.address_type(@address_form)
      render template: 'settings/index'
    end
  end

  private

  def settings
    @settings = Settings::SettingsIndexService.new(current_user)
    @address_form = Settings::AddressesService.new(params, current_user, current_order).address_form
  end
end
