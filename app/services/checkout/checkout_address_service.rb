module Checkout
  class CheckoutAddressService < Settings::AddressesService
    def call
      return save_addresses if billing_form.valid? && shipping_form.valid?

      save_addresses_use_billing if billing_form.valid? && params[:use_billing]
    end

    def show
      Settings::SettingsIndexService.new(current_user)
    end

    private

    def save_addresses
      create_or_update(billing_form)
      create_or_update(shipping_form)
      return_step
    end

    def save_addresses_use_billing
      create_or_update(billing_form)
      create_or_update(shipping_use_billing_form)
      return_step
    end

    def shipping_use_billing_form
      shipping_form = billing_form
      shipping_form.address_type = SHIPPING
    end

    def create_or_update(form)
      form ? form.update : form.create
    end

    def return_step
      (@current_order.choosing_delivery! if @current_order.may_choose_delivery?) || params[:step]
    end
  end
end
