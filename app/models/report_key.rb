class ReportKey < ActiveRecord::Base
  extend FriendlyId
  friendly_id :report_key, use: :slugged
  #t.string :code
  #t.string :name
  #t.boolean :active

  class << self
    def active
     where(active: true).uniq
    end

    def active_keycodes
     where(active: true).uniq.pluck(:report_key)
    end

  end
end
