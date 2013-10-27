# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :mittel do
    process :resize_to_fill => [100, 100]
  end

  version :thumb do
    process :resize_to_fill => [30, 30]
  end

end
