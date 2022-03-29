# frozen_string_literal: true

class Property < ApplicationRecord
  # Rspec
  # scope :for_sale_properties, -> { where(for_sale: true) }
  # scope :for_rent_properties, -> { where(for_sale: false) }
  validates :name, :address, :price, :rooms, :parking_spaces, :square_feet, :details, :bathrooms, presence: true

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/img'
  validates_attachment_content_type :photo, content_type: %r{\Aimage/.*\z}

  scope :latest, -> { order created_at: :desc }

  belongs_to :account

  scope :sold, -> { where(for_sale: true, status: 'sold') }
  scope :for_sale, -> { where(for_sale: true, status: 'available') }
  scope :leased, -> { where(for_sale: false, status: 'leased') }
  scope :for_rent, -> { where(for_sale: false, status: 'available') }

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end

  mount_uploaders :documentos, DocumentoUploader
end
