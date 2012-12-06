# encoding: utf-8
require 'carrierwave/processing/mime_types'

class UserAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :set_content_type

  version :thumb do
    process resize_to_fill: [48, 48]
  end

  version :regular do
    process resize_to_fill: [64, 64]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "avatar#{File.extname(original_filename)}" if original_filename
  end
end
