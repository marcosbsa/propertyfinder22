# frozen_string_literal: true

module PropertiesHelper
  def property_thumbnail(property)
    img = property.photo.present? ? property.photo.url(:medium) : '/img'
    image_tag img, class: 'property-medium'
  end

  def property_thumbnail_url(property)
    property.photo.present? ? property.photo.url(:medium) : '/img'
  end

  def property_photo_url(property)
    property.photo.present? ? property.photo.url : '/img'
  end
end
