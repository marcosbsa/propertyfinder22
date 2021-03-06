# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :url, :summary, :body, presence: true

  scope :active, -> { where(active: true) }
  scope :latest, -> { order created_at: :desc }

  has_attached_file :image2, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/img'
  validates_attachment_content_type :image2, content_type: %r{\Aimage/.*\z}

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end
end
