class AddressesController < ApplicationController
  before_action :address_form, only: :create

  def create
    billing_form
    shipping_form
    @email_form = EmailForm.new
    if @address_form.update(address_params)
      redirect_to(settings_path, notice: I18n.t('settings.new.updated', type: @address_form.address_type.capitalize))
    else
      @billing_form = @address_form if address_params[:address_type] == 'billing'
      @shipping_form = @address_form if address_params[:address_type] == 'shipping'
      render 'settings/index'
    end
  end

  private

  def address_form
    @address_form = AddressForm.new(address_params)
  end

  def billing_form
    @billing_form = AddressForm.new.find_or_create_by('billing', current_user)
  end

  def shipping_form
    @shipping_form = AddressForm.new.find_or_create_by('shipping', current_user)
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
