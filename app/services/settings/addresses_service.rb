module Settings
  class AddressesService
    BILLING = 'billing'.freeze
    SHIPPING = 'shipping'.freeze

    attr_reader :params, :current_user, :billing_form, :shipping_form, :address_form

    delegate :create, to: :address_form
    delegate :update, to: :address_form

    def initialize(params, current_user, current_order)
      @params = params
      @current_user = current_user
      @current_order = current_order
      @billing_form = AddressForm.new(address_params(:billing_form)) if params[:billing_form]
      @shipping_form = AddressForm.new(address_params(:shipping_form)) if params[:shipping_form]
      @address_form = params[:billing_form] ? @billing_form : @shipping_form
    end

    private

    def address_params(type)
      params.require(type).permit(:first_name, :last_name, :address, :city,
                                  :country, :zip, :phone, :user_id, :address_type)
    end
  end
end
