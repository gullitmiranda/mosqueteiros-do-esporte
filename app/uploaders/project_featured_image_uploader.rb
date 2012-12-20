# encoding: utf-8
require 'carrierwave/processing/mime_types'

class ProjectFeaturedImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :set_content_type
  process quality: 60

  version :regular do
    process resize_to_fill: [320, 520]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "featured_image#{File.extname(original_filename)}" if original_filename
  end
end
