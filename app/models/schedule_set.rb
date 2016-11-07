require 'oag/process'
require 'filter_destinations_worker'

class ScheduleSet < ActiveRecord::Base
  include Workflow
  belongs_to :report_key

  has_many :oag_schedules, dependent: :destroy

  scope :keyed, lambda {|report_keys| where(report_key: [report_keys].flatten)}
  scope :latest, -> { order(updated_at: :desc).first}
  scope :complete,  -> { where(complete: true) }
  scope :incomplete,  -> { where(complete: false) }

  after_initialize :set_null_report_key
  before_destroy   :unset_report_key

  workflow do
    state :uninitialized do
      event :process_attachment, :transitions_to => :queued
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :queued do
      event :import_oag_file, :transitions_to => :schedules_loaded
      event :queue_large_oag_file, :transition_to => :queued_for_large_file
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :queued_for_large_file do
      event :import_large_oag_file, :transitions_to => :schedules_loaded
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized

    end
    state :schedules_loaded do
      event :refresh_airports, :transitions_to => :airports_refreshed
      event :reject, :transitions_to => :rejected
      event :process_attachment, :transitions_to => :queued
      event :reset, :transitions_to => :uninitialized
    end
    state :airports_refreshed do
      event :refresh_airlines, :transitions_to => :airlines_refreshed
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized

      event :process_attachment, :transitions_to => :queued
    end
    state :airlines_refreshed do
       event :refresh_direct_flights, :transitions_to => :direct_flights_refreshed
       event :reject, :transitions_to => :rejected
       event :reset, :transitions_to => :uninitialized

       event :process_attachment, :transitions_to => :queued
    end
    state :direct_flights_refreshed do
       event :finalize, :transitions_to => :finished
       # event :refresh_destinations, :transitions_to => :destinations_refreshed
       event :reject, :transitions_to => :rejected
       event :reset, :transitions_to => :uninitialized

       event :process_attachment, :transitions_to => :queued

    end
    # state :destinations_refreshed do
    #    event :refresh_cnx_pairs, :transitions_to => :connections_refreshed
    #    event :reject, :transitions_to => :rejected
    #    event :reset, :transitions_to => :uninitialized
    #
    #    event :process_attachment, :transitions_to => :queued
    #
    # end
    # state :connections_refreshed do
    #   event :wait_for_destinations_filter, :transitions_to => :waiting_for_destinations_filtered
    #   event :reject, :transitions_to => :rejected
    #   event :reset, :transitions_to => :uninitialized
    #
    #   event :process_attachment, :transitions_to => :queued
    # end
    # state :waiting_for_destinations_filtered do
    #   event :finalize, :transitions_to => :finished
    #   event :reject, :transitions_to => :rejected
    #   event :reset, :transitions_to => :uninitialized
    #
    #   event :process_attachment, :transitions_to => :queued
    # end
    state :finished
    state :rejected

    after_transition do |from, to, triggering_event, *event_args|
      case to
        when /uninitialized|finished|rejected|queued_for_large_file/
          stash_log "#{msg_id} #{id}: #{report_key_code} completed: #{from} -> #{to}, #{triggering_event}!"
        else
          stash_log "#{msg_id} #{id}: #{report_key_code} completed: #{from} -> #{to}, #{triggering_event}!  Calling ScheduleImportWorker"

          dly = (5..10).to_a.sample
          ScheduleImportWorker.delay_for(dly).perform_async(id)
      end
    end


  end

  # Linear State Machine Advance method
  def advance_state!
    case current_state.name
      when /unitialized/
        process_attachment!
      when /queued/
        import_oag_file!
      when /queued_for_large_file/
        import_large_oag_file!
      when /schedules_loaded/
        refresh_airports!
      when /airports_refreshed/
        refresh_airlines!
      when /airlines_refreshed/
        refresh_direct_flights!
      when /direct_flights_refreshed/
        finalize!
      # when /destinations_refreshed/
      #   refresh_cnx_pairs!
      # when /connections_refreshed/
      #   wait_for_destinations_filter!
      # when /waiting_for_destinations_filtered/
      #   finalize!
    end
  end
  
  def reset
    #TODO enable button to reset schedule import.
  end

  # State Machine events
  def process_attachment

      process_email_attachment
      estimated_report_key  = ReportKey.match_filename(report_name)
      if estimated_report_key.is_a? ReportKey
        self.report_key = estimated_report_key
        save
      else
        stash_log "Report rejected due to  undefined or invalid report key #{report_name}"
        self.load_status['attachment_status'] = 'undefined or invalid report key'
        self.attachment_status ='undefined or invalid report key'
        self.report_key_id = nil
        save
        reject!
        halt
      end
  end

  def import_oag_file
      if self.report_key.active
        self.load_status['report_key_active'] = true
        self.report_key.reset!
        self.report_key.import_schedule!
        self.report_key.save
        self.load_status['schedule_import_time'] = DateTime.now.in_time_zone
        if large_report?
          ScheduleLargeImportWorker.delay_for(60).perform_async(self.id)
          queue_large_oag_file!
          halt
        else
          processor.import_oag_file(self)
        end
        save
      else
        stash_log "Report rejected due to report key active == false #{report_name}"
        self.load_status['report_key_active'] = false
        save
        reject!
        halt
      end
  end
  def import_large_oag_file!
        self.load_status['schedule_import_time'] = DateTime.now.in_time_zone

        processor.import_large_oag_file(self)
        save
    end


  def refresh_airports
    processor.refresh_airports(self)
    save
  end
  def refresh_airlines
    processor.refresh_airlines(self)
    save
  end
  def refresh_direct_flights
    processor.refresh_direct_flights(self)
    save
  end
  # def refresh_destinations
  #   self.load_status['destinations_map_status'] = 'refreshing'
  #   processor.refresh_destinations(self)
  #   self.load_status['destinations_map_status'] = 'refreshed'
  #   FilterDestinationsWorker.perform_async(id)
  #   save
  # end
  # def refresh_cnx_pairs
  #   processor.refresh_cnx_pairs(self)
  #   save
  # end
  # def wait_for_destinations_filter
  # end

  def finalize
    # unless load_status['destinations_map_status'].eql? 'eff_days_filtered'
    #   stash_log "#{msg_id} #{id}: #{report_key_code}  -> waiting for destinations filter"
    #   ScheduleImportWorker.delay_for(1.minute).perform_async(id)
    #   halt
    # else
    finalize_attachment('processed')
      report_key.cycle_schedules(self)
      report_key.confirm_schedule_load!
      report_key.save
      save

      report_key.brands.each do |brand|
        if brand.active? and AppSwitch.on?('autogenerate_routemaps')
          BrandRouteMapsSyncWorker.perform_async({'brand_key': brand.brand_key, 'schedule_set_id': self.id, 'report_key': report_key.code})
          # export_report = brand.active_export_report
          # export_report = brand.next_export_report unless export_report
          # Rails.logger.info "Setting Report Key #{report_key.code} state to ready,  brand.export_state => #{ brand.export_state.current_state}"
          # Rails.logger.info "Setting Report Key #{report_key.code} export_report.current_state => #{ export_report.current_state}"
          #
          # export_report.schedule_report_keys[report_key.code] = {'status': 'ready', 'seq': report_key.current_seq}
          # export_report.save
          # # Don't kick off a new worker if one is running.
          # if brand.export_state.idle?
          #   r = Oag::Report.new
          #   r.auto_export_route_maps(brand, export_report)
          # end
        end
      end

    # end
  end

  def reject
    finalize_attachment('rejected')
    if self.report_key
      self.report_key.reset!
      self.report_key.save
    end

    save
  end


  # Helper methods
  def report_key_code
    report_key ? report_key.code : 'No Report Key Matched'
  end


  def processor
    Oag::Process.new
  end

  def report_path
    load_status["report_path"]
  end
  def report_name
    if report_path
      File.basename(report_path,File.extname(report_path))
    elsif attachment_path
      File.basename(attachment_path,File.extname(attachment_path))
    else
      'UNKNOWN'
    end
  end
  def large_report?
    attachment_lines > 10000
  end
  def report_file_string
    unless report_path and File.exist? report_path
      if File.exist?(attachment_path)
        process_oag_file
      end
    end
    if report_path and File.exist? report_path
      return  File.readlines(report_path).join
    end
  end



  def process_email_attachment
    # TODO:  Check for Existing Report Key filename patterns and only process if Key Exists.

    stash_log "Decompressing Email Attachment for message #{msg_id} #{attachment_path}"
    ext = File.extname(attachment_path)

    if ext.eql? '.csv'
      if File.exists? attachment_path
        update(attachment_status: 'stored', attachment_size: File.stat(attachment_path).size)
        self.load_status['attachment_status'] =  'uncompressed'
        self.load_status['report_path'] =  attachment_path
        self.load_status['report_size'] =  attachment_size
        save

      end
    elsif ext.eql? '.zip'
      if File.exist? attachment_path
        update(attachment_status: 'stored',attachment_size: File.stat(attachment_path).size)
      end


      Zip::File.open(attachment_path) do |zip_file|
          # Handle entries one by one - nope should only be 1 entry
          entry = zip_file.first
          # Extract to file/directory/symlink
          uncompressed_filename   = entry.name.squish.gsub(" ", "_")
          uncompressed_path       = File.join( File.dirname(attachment_path), uncompressed_filename )
          entry.extract(uncompressed_path)

          self.load_status['report_path'] = uncompressed_path
          self.load_status['report_size'] = File.stat(uncompressed_path).size
          self.load_status['attachment_status'] =  'uncompressed'
          save

      end


      # Zip::InputStream::open(attachment_path) {|io|
      #    entry = io.get_next_entry
      #    uncompressed_filename   = entry.name.squish.gsub(" ", "_")
      #    uncompressed_path       = File.join( File.dirname(attachment_path), uncompressed_filename )
      #    File.open(uncompressed_path, 'wb'){|f| f << io.read}
      #
      #    self.load_status['report_path'] = uncompressed_path
      #    self.load_status['report_size'] = File.stat(uncompressed_path).size
      #    self.load_status['attachment_status'] =  'uncompressed'
      #    save
      #
      # }
    end
    save

  end
  def active?
    report_key and self.eql? report_key.current_schedule_set
  end

  def to_label
    "#{current_state.name} #{updated_at}"
  end

  def stash_log msg
    Rails.logger.info msg
    self.log_data << msg
    save
  end

  private
   def set_null_report_key
     # self.report_key = ReportKey.none
     # self.report_key = ReportKey.where(name: 'Null Report', report_key: 'NONE').first_or_create if report_key.blank?
   end
  def unset_report_key
     if report_key.current_schedule_set_id.eql? self.id
        report_key.current_schedule_set_id = nil
        prev_set = ScheduleSet.keyed(report_key).where.not(id: self.id).with_finished_state.latest
        unless prev_set.blank?
          report_key.current_schedule_set_id = prev_set.id
        end
        report_key.save
     end
  end


   def finalize_attachment(status)
         #TODO provide the option to store the processed files in the processed folder
        stash_log "Finalizing #{attachment_path} import"

        File.delete attachment_path if File.exist?(attachment_path)
        if report_path
          File.delete report_path if File.exist?(report_path)
        end
        Mastiff::Email.finalize([msg_id], status)
        self.load_status['attachment_status'] = status
        self.complete = true
        save
    end
end
