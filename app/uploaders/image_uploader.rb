# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  version :large do
    process resize_to_fill: [400, 300]
  end

  version :coverflow do
    process resize_to_fill: [800, 400]
  end

  version :thumbnail do
    process resize_to_fill: [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
