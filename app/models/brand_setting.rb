class BrandSetting < ActiveRecord::Base
  belongs_to :brand
  validates_presence_of :default_currency
  validates_presence_of :max_segments
  after_initialize :defaults, unless: :persisted?
  # ":if => :new_record?" is equivalent in this context

  def defaults
    self.default_currency ||= 'SGD'
  end
end
