# frozen_string_literal: true

class DocumentoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Medium
  version :medium do
    process resize_to_fit: [150, 150]
  end

  # Tipos de extensão aceitas
  def extension_whitelist
    %w[jpg jpeg png]
  end
end
