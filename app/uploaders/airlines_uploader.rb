require 'carrierwave/processing/mime_types'
# encoding: utf-8

class AirlinesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes

  process :set_content_type

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    #"data/oag/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    File.join Rails.root, 'data', 'oag', 'airlines'
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(xls zip)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    case File.extname original_filename
    when /.zip/
      "oag_airlines.xls.zip"
    when /.xls/
      "oag_airlines.xls"
    end
  end
  #def to_jq_upload
  #  {
  #    "name" => read_attribute(:avatar),
  #    "size" => avatar.size,
  #    "url" => avatar.url,
  #    "thumbnail_url" => avatar.thumb.url,
  #    "delete_url" => picture_path(:id => id),
  #    "delete_type" => "DELETE"
  #  }
  #end
end
