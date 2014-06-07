class ReportKey < ActiveRecord::Base
  extend FriendlyId
  friendly_id :report_key, use: :slugged
  #t.string :code
  #t.string :name
  #t.boolean :active

  scope :active,  -> { where(active: true) }

end
