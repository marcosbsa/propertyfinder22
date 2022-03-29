# frozen_string_literal: true

class Property < ApplicationRecord
  validates :name, :address, :price, :rooms, :bathrooms, :parking_spaces, :square_feet, :details, presence: true
  validates :price, :rooms, :parking_spaces, :square_feet, :bathrooms, numericality: { greater_than: 0 }

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
