class AirlineFile
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend CarrierWave::Mount
  mount_uploader :source , AirlinesUploader
end