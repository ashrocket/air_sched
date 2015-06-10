class ReportKey < ActiveRecord::Base
  extend FriendlyId
  friendly_id :report_key, use: :slugged

  has_many :interline_cxr_rules
  #t.string :code
  #t.string :name
  #t.boolean :active

  class << self
    def keyed report_key
       where("report_key = ?",  report_key).first
    end

    def current_report
      where(report_key: ABBConfig.data_key).first
    end
    def active
     where(active: true).uniq
    end

    def active_keycodes
     where(active: true).uniq.pluck(:report_key)
    end

    def match_key(pattern)
      key = nil
      matched_list = []
      all.each do |report_key|
        matches = pattern.match(report_key.file_pattern)
        matched_list <<  {key: report_key, match: matches.captures.first.lstrip} if matches
      end
      unless matched_list.empty?
        matched_list.sort_by! { |m| m[:match].length}
        key = matched_list.last[:key]
      end
      key
    end

  end
  def initialize(attributes = {})
    name = "REPORT NAME IS REQUIRED"
    super
  end
end
