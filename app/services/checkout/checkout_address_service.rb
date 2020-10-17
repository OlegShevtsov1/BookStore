module Checkout
  class CheckoutAddressService < Settings::AddressesService
    NEXT_STEP = 'delivery'.freeze

    attr_reader :params, :current_user, :current_order

    # def initialize(params, current_user, current_order)
    #   super
    # end

    def call
      binding.pry
      # return create_billing_shipping_forms if billing_form.valid? && params[:use_billing]

      create_or_update_checkout_addresses if billing_form.valid? && shipping_form.valid?
      NEXT_STEP
      # false
    end

    private

    def create_or_update_checkout_addresses
      binding.pry
      create_or_update_address(billing_form, current_order.addresses.billing)
      create_or_update_address(shipping_form, current_order.addresses.shipping)
    end

    def create_billing_shipping_forms
      create_or_update_address(billing, current_order.addresses.billing)
      billing.address_type = Address.address_types.keys.last
      create_or_update_address(billing, current_order.addresses.shipping)
    end

    def create_or_update_address(form_object, data_address)
      address = data_address.first
      @form = form_object
      address ? update_address(address) : create_address
    end
  end
end
