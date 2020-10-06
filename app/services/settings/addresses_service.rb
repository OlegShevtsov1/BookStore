module Settings
  class AddressesService
    BILLING = 'billing'.freeze
    SHIPPING = 'shipping'.freeze

    attr_reader :current_user, :billing_form, :shipping_form

    def initialize(current_user)
      @current_user = current_user
      @billing_form = address(BILLING)
      @shipping_form = address(SHIPPING)
    end

    def address_type(address_form, address_params)
      address_params[:address_type] == BILLING ? @billing_form = address_form : @shipping_form = address_form
    end

    def address(type)
      Address.find_by(address_type: type, user_id: current_user.id) || Address.new
    end
  end
end
