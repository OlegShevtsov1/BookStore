class AddressDecorator < Draper::Decorator
  delegate_all

  delegate :address, to: :object

  def name
    [object.first_name, object.last_name].join(' ')
  end
end
