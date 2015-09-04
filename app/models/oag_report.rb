require 'oag/process'
require 'filter_destinations_worker'

class OagReport < ActiveRecord::Base
  include Workflow
  belongs_to :report_key


  scope :keyed, lambda {|report_keys| where(report_key: [report_keys].flatten)}
  scope :latest, -> { order(updated_at: :desc).first}
  scope :complete,  -> { where(complete: true) }
  scope :incomplete,  -> { where(complete: false) }

  after_initialize :set_null_report_key


  workflow do
    state :uninitialized do
      event :process_attachment, :transitions_to => :queued
      event :reject, :transitions_to => :rejected
    end
    state :queued do
      event :import_oag_file, :transitions_to => :schedules_loaded
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :schedules_loaded do
      event :refresh_airports, :transitions_to => :airports_refreshed
      event :reject, :transitions_to => :rejected
      event :process_attachment, :transitions_to => :queued

    end
    state :airports_refreshed do
      event :refresh_airlines, :transitions_to => :airlines_refreshed
      event :reject, :transitions_to => :rejected
      event :process_attachment, :transitions_to => :queued
    end
    state :airlines_refreshed do
       event :refresh_direct_flights, :transitions_to => :direct_flights_refreshed
       event :reject, :transitions_to => :rejected
       event :process_attachment, :transitions_to => :queued
    end
    state :direct_flights_refreshed do
       event :refresh_destinations, :transitions_to => :destinations_refreshed
       event :reject, :transitions_to => :rejected
       event :process_attachment, :transitions_to => :queued

    end
    state :destinations_refreshed do
       event :refresh_cnx_pairs, :transitions_to => :connections_refreshed
       event :reject, :transitions_to => :rejected
       event :process_attachment, :transitions_to => :queued

    end
    state :connections_refreshed do
      event :wait_for_destinations_filter, :transitions_to => :waiting_for_destinations_filtered
      event :reject, :transitions_to => :rejected
      event :process_attachment, :transitions_to => :queued
    end
    state :waiting_for_destinations_filtered do
      event :finalize, :transitions_to => :finished
      event :reject, :transitions_to => :rejected
      event :process_attachment, :transitions_to => :queued
    end
    state :finished
    state :rejected

    after_transition do |from, to, triggering_event, *event_args|
      case to
        when /unitialized|finished|rejected/
          Rails.logger.info "#{msg_id} #{id}: #{report_key.code} #{triggering_event} transitioned FROM #{from} -> #{to}"
        else
          Rails.logger.info "#{msg_id} #{id}: #{report_key.code} #{triggering_event} transitioned FROM #{from} -> #{to} calling ScheduleImportWorker"

          dly = (30..300).to_a.sample
          ScheduleImportWorker.delay_for(dly).perform_async(id)
      end
    end

    on_transition do |from, to, triggering_event, *event_args|
      Rails.logger.info "#{msg_id} #{id}: #{report_key.code} #{triggering_event} transitioning FROM #{from} -> #{to}"
    end
  end

  # Linear State Machine Advance method
  def advance_state!
    case current_state.name
      when /unitialized/
        process_attachment!
      when /queued/
        import_oag_file!
      when /schedules_loaded/
        refresh_airports!
      when /airports_refreshed/
        refresh_airlines!
      when /airlines_refreshed/
        refresh_direct_flights!
      when /direct_flights_refreshed/
        refresh_destinations!
      when /destinations_refreshed/
        refresh_cnx_pairs!
      when /connections_refreshed/
        wait_for_destinations_filter!
      when /waiting_for_destinations_filtered/
        finalize!
    end
  end
  


  # State Machine events
  def process_attachment

      process_email_attachment
      estimated_report_key  = ReportKey.match_filename(report_name)
      if estimated_report_key.is_a? ReportKey
        self.report_key =estimated_report_key
      else
        Rails.logger.info "Report rejected due to  undefined or invalid report key #{report_name}"
        self.load_status['attachment_status'] = 'undefined or invalid report key'
        self.attachment_status ='undefined or invalid report key'
        save
        reject!
      end
      save
  end

  def import_oag_file
      self.report_key.state = 'processing'
      self.report_key.save
      self.load_status['schedule_import_time'] = Time.now

      if large_report?
        ScheduleLargeImportWorker.perform_async(id)
      else
        processor.import_oag_file(self)
      end
      save
  end

  def refresh_airports
    processor.refresh_airports(self)
    save
    UpdateAirportsWorker.perform_async()
  end
  def refresh_airlines
    processor.refresh_airlines(self)
    save
  end
  def refresh_direct_flights
    processor.refresh_direct_flights(self)
    save
  end
  def refresh_destinations
    self.load_status['destinations_map_status'] = 'refreshing'
    processor.refresh_destinations(self)
    self.load_status['destinations_map_status'] = 'refreshed'
    FilterDestinationsWorker.perform_async(id)
    save
  end
  def refresh_cnx_pairs
    processor.refresh_cnx_pairs(self)
    save
  end
  def wait_for_destinations_filter
  end

  def finalize
    unless load_status['destinations_map_status'].eql? 'eff_days_filtered'
      Rails.logger.info "#{msg_id} #{id}: #{report_key.code}  -> waiting for destinations filter"
      ScheduleImportWorker.delay_for(1.minute).perform_async(id)
      halt
    else
      processor.finalize(self, 'processed')
      self.report_key.state = 'idle'
      self.report_key.save
      save

      delay_time = 60
      report_key.brands.each do |brand|
        report = ExportSmartRouteReport.create(brand: brand)
        ExportBrandRouteMapsWorker.delay_for(delay_time.minute).perform_async(brand.brand_key, report.id)
      end

    end
  end
  def reject
    processor.finalize(self, 'processed')
    self.report_key.state = 'idle'
    self.report_key.save

    save
  end


  # Helper methods
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

    Rails.logger.info "Decompressing Email Attachment for message #{msg_id} #{attachment_path}"

    ext = File.extname(attachment_path)

    if ext.eql? '.csv'
      if File.exists? attachment_path
        update(attachment_status: 'stored',attachment_size: File.stat(attachment_path).size)
        self.load_status['attachment_status'] =  'uncompressed'
        self.load_status['report_path'] =  attachment_path
        self.load_status['report_size'] =  load_status['attachment_size']
        save

      end
    elsif ext.eql? '.zip'
      if File.exist? attachment_path
        update(attachment_status: 'stored',attachment_size: File.stat(attachment_path).size)
      end
      Zip::InputStream::open(attachment_path) {|io|
         entry = io.get_next_entry
         uncompressed_filename   = entry.name.squish.gsub(" ", "_")
         uncompressed_path       = File.join( File.dirname(attachment_path), uncompressed_filename )
         File.open(uncompressed_path, 'wb'){|f| f << io.read}

         self.load_status['report_path'] = uncompressed_path
         self.load_status['report_size'] = File.stat(uncompressed_path).size
         self.load_status['attachment_status'] =  'uncompressed'
         save

      }
    end
    save

  end

  private
   def set_null_report_key
     self.report_key = ReportKey.where(name: 'Null Report', report_key: 'NONE').first_or_create if report_key.blank?
   end
end
