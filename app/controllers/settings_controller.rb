class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billing_form = AddressForm.new.find_or_create_by('billing', current_user)
    @shipping_form = AddressForm.new.find_or_create_by('shipping', current_user)
  end
end
