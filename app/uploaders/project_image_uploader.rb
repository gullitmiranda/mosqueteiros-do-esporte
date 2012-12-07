# encoding: utf-8
require 'carrierwave/processing/mime_types'

class ProjectImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :set_content_type
  process quality: 60

  version :featured do
    process resize_to_fill: [320, 520]
  end

  version :regular do
    process resize_to_fill: [1280, 860]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "image#{File.extname(original_filename)}" if original_filename
  end
end
