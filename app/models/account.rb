# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Rspec:
  validates :email, :encrypted_password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  has_attached_file :image1, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/img'
  validates_attachment_content_type :image1, content_type: %r{\Aimage/.*\z}

  has_attached_file :coverimg, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/img'
  validates_attachment_content_type :coverimg, content_type: %r{\Aimage/.*\z}

  has_many :properties, dependent: :destroy
  # dependent: :destroy  = ao excluir o usuário os cadastros de imoveis tambem serao destruidos.

  def full_name
    "#{first_name} #{last_name}"
  end

  # def company
  #   "test"
  # end
end
