class Hub < ActiveRecord::Base
  extend FriendlyId
  friendly_id :code, use: [:slugged, :finders]
  #t.string :code
  #t.string :name
  #t.boolean :active

  scope :active,  -> { where(active: true) }

end
