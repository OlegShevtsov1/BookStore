class BookDecorator < Draper::Decorator
  include ActiveSupport::NumberHelper

  DESCRIPTION_LIMIT = 250
  DEFAULT_IMAGE = 'active_admin/default.png'.freeze
  COMA = ','.freeze
  delegate_all

  def price
    number_to_currency(object.price, unit: I18n.t('EUR'))
  end

  def authors
    object.authors.decorate.map(&:name).join COMA
  end

  def properties
    "H:#{object.heigth}\" x W: #{object.width}\" x D: #{object.depth}"
  end

  def short_description
    object.description[0..DESCRIPTION_LIMIT]
  end

  def description_length_short?
    object.description.length < DESCRIPTION_LIMIT
  end

  def image_url(thumbnail)
    object.image_url(thumbnail).presence || DEFAULT_IMAGE
  end

  def image_custom(thumbnail, width, height)
    object.image.derivation_url(thumbnail, width, height) || DEFAULT_IMAGE
  end
end
