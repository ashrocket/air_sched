class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :brand_key, use: :slugged

end