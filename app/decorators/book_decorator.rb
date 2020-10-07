class BookDecorator < Draper::Decorator
  DESCRIPTION_LIMIT = 250
  DEFAULT_IMAGE = 'active_admin/default.png'.freeze
  delegate_all

  def authors
    object.authors.decorate.map(&:name).join ', '
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

  def image_url
    object.image_url.presence || DEFAULT_IMAGE
  end
end
