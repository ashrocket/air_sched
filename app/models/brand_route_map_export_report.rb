require 'oag/process'
require 'oag/exporters/smart_routes_exporter'


class BrandRouteMapExportReport < ActiveRecord::Base
  belongs_to :brand
  include Workflow
  before_create :set_expected_report_keys

  validates :brand_id, presence: true

  scope :branded,      lambda {|brand|    where(brand: brand)}
  scope :latest, -> { order(updated_at: :desc).first}
  scope :in_progress, -> { where.not(workflow_state: ['exported', 'rejected'])}




  workflow do
    state :uninitialized do
      event :verify_report_keys, :transitions_to => :waiting_for_report_keys
      event :confirm_report_keys, :transitions_to => :report_keys_loaded
      event :finalize, :transitions_to => :exported
      event :reject, :transitions_to => :rejected

    end
    state :waiting_for_report_keys do
      event :verify_report_keys, :transitions_to => :waiting_for_report_keys
      event :confirm_report_keys, :transitions_to => :report_keys_loaded
      event :reject, :transitions_to => :rejected
    end
    state :report_keys_loaded do
      event :build_connections, :transitions_to => :building_connections
      event :reject, :transitions_to => :rejected
    end
    state :building_connections do
      event :confirm_connections, :transitions_to => :connections_built
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :connections_built do
      event :build_smart_routes, :transitions_to => :building_smart_routes
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :building_smart_routes do
      event :confirm_smart_routes, :transitions_to => :smart_routes_built
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :smart_routes_built do
      event :build_route_maps, :transitions_to => :building_route_maps
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :building_route_maps do
      event :confirm_route_maps, :transitions_to => :route_maps_built
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :route_maps_built do
      event :finalize, :transitions_to => :exported
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
     end
    state :exported
    state :rejected

   
    on_transition do |from, to, triggering_event, *event_args|
         Rails.logger.info "#{self.id}: #{self.brand.name} Brand: Event #{triggering_event} transitioning FROM #{from} -> #{to}"
    end
  end

  # Linear State Machine Advance method
    def advance_state!
      case current_state.name
        when /uninitialized/
          verify_report_keys!
        when /waiting_for_report_keys/
          confirm_report_keys!
        when /report_keys_loaded/
          build_connections!
        when /building_connections/
          confirm_connections!
        when /connections_built/
          build_smart_routes!
        when /building_smart_routes/
          confirm_smart_routes!
        when /smart_routes_built/
          build_route_maps!
        when /building_route_maps/
          confirm_route_maps!
        when /route_maps_built/
          finalize!
      end
    end

    def verify_report_keys
        Rails.logger.info "#{brand.name}  Brand: -> confirming Import Reports are finished."
        if report_keys_ready?
            Rails.logger.info "#{brand.name} Brand:  -> Import Reports  complete."
            confirm_report_keys!
            halt
        else
            waiting_since = (DateTime.now.in_time_zone  - self.created_at)
            timeout_seconds = brand.settings.schedule_load_timeout * 60
            Rails.logger.info "BrandRouteMapExportReport(#{brand.brand_key}) - timeout check #{waiting_since} > #{timeout_seconds}"

            # Check for Timeout and then use older keys or reject.
            if waiting_since > timeout_seconds

              if report_keys_valid?
                Rails.logger.info "!!! BrandRouteMapExportReport(#{brand.brand_key}) waiting for #{waiting_since}, using older report cancelling."
                use_latest_valid_keys
                confirm_report_keys!
                halt
              else
                Rails.logger.info "!!! BrandRouteMapExportReport(#{brand.brand_key}) " +
                                  " exp:#{expected_schedule_report_keys}} state:#{schedule_report_keys}"

                Rails.logger.info "!!! BrandRouteMapExportReport(#{brand.brand_key}) waiting for #{waiting_since} cancelling."
                reject!
                halt
                brand.export_state.reset!
                brand.data_state.reset!
              end
            else

              dly  = (5..30).to_a.sample
              BrandRouteMapsSyncWorker.delay_for(dly).perform_async({'brand_key': brand.brand_key, 'export_report_id': self.id})
            end
        end
    end

    def confirm_report_keys
      Rails.logger.info "#{brand.name}  Brand: -> confirmed Import Reports are ready, calling BrandRouteMapsExportWorker."
      brand.export_state.export_route_maps!(self.id)
    end

  
    def confirm_connections
      if brand.data_state.waiting_for_connections_build?
        Rails.logger.info "#{brand.name} :  -> Waiting for branded connections to complete ..."
        BrandRouteMapsExportWorker.delay_for(2.minute).perform_async(brand.brand_key, self.id)
        halt
      else
        Rails.logger.info "#{brand.name} :  -> Branded connections  complete."
        BrandRouteMapsExportWorker.delay_for(5).perform_async(brand.brand_key, self.id)
      end
    end
    def confirm_smart_routes
      if brand.data_state.waiting_for_smart_routes_build?
        Rails.logger.info "#{brand.name} :  -> Waiting for Smart Routes to complete ..."
        BrandRouteMapsExportWorker.delay_for(2.minute).perform_async(brand.brand_key, self.id)
        halt
      else
        Rails.logger.info "#{brand.name} :  -> Smart Routes  complete."
        BrandRouteMapsExportWorker.delay_for(5).perform_async(brand.brand_key, self.id)
      end


    end
    def confirm_route_maps
      if brand.data_state.waiting_for_route_maps_build?
        Rails.logger.info "#{brand.name} :  -> Waiting for Route Maps to complete ..."
        BrandRouteMapsExportWorker.delay_for(2.minute).perform_async(brand.brand_key, self.id)
        halt
      else
        Rails.logger.info "#{brand.name} :  -> Route Maps complete."
        BrandRouteMapsExportWorker.delay_for(5).perform_async(brand.brand_key, self.id)
      end
    end
  
  
    def build_connections
      dly = (60..180).to_a.sample
      BrandRouteMapsExportWorker.delay_for(dly).perform_async(brand.brand_key,self.id)
      Rails.logger.info "#{brand.name} :  -> Building Brand Connections - brand.data_state? #{brand.data_state.current_state}"
      brand.data_state.build_connections!

       #
       # Rails.logger.info "#{brand.name} :  -> Building Brand Connections - brand.processing_connections? #{brand.processing_connections?}"
       #
       # if  brand.processing_connections?
       #   Rails.logger.info "#{brand.name} :  -> Waiting for branded connections to complete ..."
       #   ExportBrandRouteMapsWorker.delay_for(2.minutes).perform_async(brand.brand_key,id)
       #   halt
       # else
       #   BrandDataProcessorWorker.delay_for(30).perform_async(brand.brand_key)
       #   # Transtion to the waiting for connections state
       #   dly = (30..120).to_a.sample
       #   ExportBrandRouteMapsWorker.delay_for(dly).perform_async(brand.brand_key,id)
       #
       #  end
    end
    def build_smart_routes
      dly = (60..180).to_a.sample
      BrandRouteMapsExportWorker.delay_for(dly).perform_async(brand.brand_key,id)
      Rails.logger.info "#{brand.name} :  -> Building Smart Routes - brand.data_state? #{brand.data_state.current_state}"
      brand.data_state.build_smart_routes!


      # if  brand.processing_connections?
      #   Rails.logger.info "#{brand.name} :  -> Waiting for smart routes to complete ..."
      #   ExportBrandRouteMapsWorker.delay_for(2.minutes).perform_async(brand.brand_key,id)
      #   halt
      # else
      #   UpdateSmartRoutesWorker.delay_for(30).perform_async(brand.brand_key)
      #   # Transtion to the waiting for connections state
      #   dly = (30..120).to_a.sample
      #   ExportBrandRouteMapsWorker.delay_for(dly).perform_async(brand.brand_key,id)
      #
      #  end
    end
    def build_route_maps
      dly = (60..180).to_a.sample
      BrandRouteMapsExportWorker.delay_for(dly).perform_async(brand.brand_key,id)
      Rails.logger.info "#{brand.name} :  -> Building Route Maps - brand.data_state? #{brand.data_state.current_state}"
      brand.data_state.build_route_maps!
    end


    def finalize
      Rails.logger.info "#{brand.name} :  -> Finalizing Route Map Export "
      
      exporter = Oag::SmartRoutesExporter.new
      url = exporter.export_to_s3(brand)
      self.location = url.to_s
      save
      brand.export_state.reset!
      brand.data_state.stats['route_maps_export'] = {'location': self.location, 'updated_at': DateTime.now.in_time_zone }
      brand.save

    end

    def reject
      brand.export_state.reset!
      brand.data_state.stats['route_maps_export'] = {'error':'rejected', 'updated_at': DateTime.now.in_time_zone }
      brand.save
    end

    #Helper Methods
    def report_key_code(report_key)
     report_key ? report_key.code : 'No Report Key Matched'
    end

    def set_ready_key(report_key, schedule_set_id)
      schedule_report_keys[report_key]['status'] = 'ready'
      schedule_report_keys[report_key]['schedule_set_id'] = schedule_set_id
      save
    end

    def use_latest_valid_keys
         schedule_report_keys.each do |schedule_key|
           # TODO: protect against empty key
           if schedule_report_keys[schedule_key]['status'].eql? 'pending'
             report_key = ReportKey.find_by(code: rk_code)
             schedule_report_keys[schedule_key]['status'] = 'ready'
             schedule_report_keys[schedule_key]['schedule_set_id'] = report_key.current_schedule_set_id
           end
        end
    end

    def report_keys_valid?
       expected_schedule_report_keys.each do |rk_code|
         report_key = ReportKey.find_by(code: rk_code)
         return (report_key.current_schedules.count > 1)
       end
       true
    end

    private
      #  This is a before create method, so No save is required
      def set_expected_report_keys
        self.expected_schedule_report_keys =  brand.report_keys.map{|rk| rk.code}.sort
        expected_schedule_report_keys.each do |rk|
          self.schedule_report_keys[rk] = Hash.new
          self.schedule_report_keys[rk]['status'] = 'pending'
        end
        brand.export_state.reset!
        brand.save

      end


      def schedule_report_key_ready?(expected_report_key)
         schedule_report_keys.has_key?(expected_report_key) and
         schedule_report_keys[expected_report_key].has_key? 'status' and
         schedule_report_keys[expected_report_key]['status'].eql? 'ready'
      end

      def report_keys_ready?
         ready = true
         expected_schedule_report_keys.each do |expected_report_key|
            key_ready = schedule_report_key_ready?(expected_report_key)
              Rails.logger.info "#{brand.name} Brand: Verifying #{expected_report_key} Report Key ready? #{key_ready}"
              unless key_ready
                ready = false
              end
         end
         ready
      end


end
