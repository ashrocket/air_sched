class ReportKey < ActiveRecord::Base
  extend FriendlyId
  friendly_id :report_key, use: [:slugged, :finders]

  has_many :brand_report_keys
  has_many :brands, through: :brand_report_keys

  has_many :oag_reports
  has_many :interline_cxr_rules
  #t.string :code
  #t.string :name
  #t.boolean :active

  class << self
    def keyed(code)
       where(report_key: code).first
    end

    def active
     where(active: true).uniq
    end

    def active_keycodes
     where(active: true).uniq.pluck(:report_key)
    end

    def current_key
      AppControl.singleton.report_key
    end

    # def set_current report_key
    #   update_all(current: false)
    #   report_key.current = true
    #   report_key.save
    # end

    def strings(report_keys)
      if  report_keys and report_keys.respond_to?(:first) and report_keys.first.is_a?(ReportKey)
          report_keys.map{|r| r.report_key}
      else
          [""]
      end
    end

    def match_filename(pattern)
      key = nil
      matched_list = []
      all.each do |report_key|
        matches = pattern.match(report_key.file_pattern)

        if  matches
          if matches.captures  and matches.captures.first
            matched_list <<  {key: report_key, match: matches.captures.first.lstrip}
          else
           matched_list <<  {key: report_key, match: matches.to_s}
          end
        end

      end
      unless matched_list.empty?
        matched_list.sort_by! { |m| m[:match].length}
        matching_key = matched_list.last[:key]
      end
      matching_key
    end

  end # End Class Methods


  def code
    report_key
  end

  # def validate
  #   errors.add_to_base 'You can only have one current report_key' unless self.current_flag_valid?
  # end
  #
  # def current_flag_valid?
  #   self.current == false ||
  #   ReportKey.has_current.size == 0 ||
  #   ( ReportKey.has_current.size == 1 && !self.current_changed?)
  # end


  def initialize(attributes = {})
    name = "REPORT NAME IS REQUIRED"
    super
  end
end
