class AirlineHost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :host_key, use: :slugged


end