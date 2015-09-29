class ReportKey < ActiveRecord::Base
  extend FriendlyId
  friendly_id :code, use: [:slugged, :finders]

  has_many :interline_cxr_rules
  has_many :brand_report_keys
  has_many :brands, through: :brand_report_keys

  has_many :oag_schedules
  has_many :schedule_sets



  has_many :current_schedules, class_name: 'OagSchedule' do
    def with_current_schedule_set
          where(schedule_set: self.current_schedule_set)
    end
  end





  include Workflow




  #t.string :code
  #t.string :name
  #t.boolean :active

  class << self
    def keyed(code)
       where(code: code).first
    end

    def active
     where(active: true).uniq
    end

    def active_keycodes
     where(active: true).uniq.pluck(:code)
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
          report_keys.map{|r| r.code}
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
        longest_match = matched_list.last
        matching_key = longest_match[:key]

      end
      matching_key
    end

  end # End Class Methods

  #
  # Instance Methods
  #



  workflow do
    state :idle do
      event :import_schedule, :transitions_to => :waiting_for_schedule_load
      event :reset, :transitions_to => :idle
    end

    state :waiting_for_schedule_load do
      event :confirm_schedule_load, :transitions_to => :idle
      event :reset, :transitions_to => :idle
    end


    after_transition do |from, to, triggering_event, *event_args|
          stash_log "ReportKey State #{code} Event: #{triggering_event} transitioned FROM #{from} -> #{to}"
    end


  end

  def current_schedule_set
    if current_schedule_set_id
      ScheduleSet.find(current_schedule_set_id)
    else
      nil
    end
  end


  def cycle_schedules(schedule_set)
    self.current_schedule_set_id = schedule_set.id
    save
  end



  def latest_finished_report
    ScheduleSet.keyed(self).with_finished_state.latest
  end
  def latest_report
    ScheduleSet.keyed(self).latest
  end

  def latest_valid_seq
      any_schedules = OagSchedule.where(report_key: self, seq: current_seq)
      if any_schedules.count > 0
        return  current_seq
      else
        return nil
      end
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

  private
    def stash_log msg
      Rails.logger.info msg
      save
    end
end
