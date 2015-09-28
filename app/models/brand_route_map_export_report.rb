require 'oag/process'
require 'oag/exporters/smart_routes_exporter'


class BrandRouteMapExportReport < ActiveRecord::Base
  belongs_to :brand
  include Workflow
  before_create :set_expected_report_keys

  validates :brand_id, presence: true

  scope :branded,      lambda {|brand|    where(brand: brand)}
  scope :latest, -> { order(updated_at: :desc).first}





  workflow do
    state :uninitialized do
      event :confirm_report_keys, :transitions_to => :report_keys_loaded
      event :finalize, :transitions_to => :exported
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



    # TODO: Add Waiting for ReportKey Reports to Complete State, to provide more visibility into the process
    def confirm_report_keys
      Rails.logger.info "#{brand.name}  Brand: -> confirming Import Reports are finished."
      expected_schedule_report_keys.each do |expected_report_key|
        initialize_expected_report_key(expected_report_key)
        if timed_out?(expected_report_key)
          self.details['rejection_reason'] = "#{brand.name} Brand: #{expected_report_key} Report Key :  -> No Import Report exists !!!"
          save
          Rails.logger.info  self.details['rejection_reason']
          reject!
          halt
          return
        end
      end
      expected_schedule_report_keys.each do |expected_report_key|
        unless schedule_report_key_ready?(expected_report_key)
          ready = false
          Rails.logger.info "#{brand.name} Brand:  #{expected_report_key} Report Key  -> Waiting for Import Report to complete or timeout ..."
          dly  = (30..120).to_a.sample
          BrandRouteMapsExportWorker.delay_for(dly).perform_async(brand.brand_key, self.id)
          halt
          return
        end
      end
      # Have to delay a tiny bit to allow state to transition
      Rails.logger.info "#{brand.name} Brand:  -> Import Reports  complete."
      BrandRouteMapsExportWorker.delay_for(5).perform_async(brand.brand_key, self.id)
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
      BrandRouteMapsExportWorker.delay_for(dly).perform_async(brand.brand_key,id)
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
      brand.data_state.stats['route_maps_export'] = {'location': self.location, 'updated_at': Time.now}
      brand.save

    end

    def reject
      brand.export_state.reset!
      brand.data_state.stats['route_maps_export'] = {'error':'rejected', 'updated_at': Time.now}
      brand.save
    end

    #Helper Methods
    def report_key_code(report_key)
     report_key ? report_key.code : 'No Report Key Matched'
    end

    private
    def set_expected_report_keys
      self.expected_schedule_report_keys =  brand.report_keys.map{|rk| rk.code}.sort
    end

    def alternate_report_key_seq(report_key)
      if rk
         return rk.latest_valid_seq
      else
         return nil
      end
    end

    def initialize_expected_report_key(expected_report_key)
      unless schedule_report_keys.has_key?(expected_report_key)
        schedule_report_keys[expected_report_key]['status'] = 'pending'
        schedule_report_keys[expected_report_key]['pending_since'] = Time.now
        schedule_report_keys[expected_report_key]['timedout'] = false
        save
      end
    end

    def schedule_report_key_ready?(expected_report_key)
       schedule_report_keys.has_key?(expected_report_key) and
       schedule_report_keys[expected_report_key].has_key? 'status' and
       schedule_report_keys[expected_report_key]['status'].eql? 'ready'
    end


    def timeout_report_key(expected_report_key)
       schedule_report_keys[expected_report_key]['timedout'] = true
       schedule_report_keys[expected_report_key]['status'] = 'timedout'
       save
    end

    def timed_out?(expected_report_key)
        if schedule_report_key_ready?(expected_report_key)
          return false
        else
          report_key = ReportKey.find_by(code: expected_report_key)
          seq = alternate_report_key_seq(report_key)
          if report_key.idle? and not seq
           timeout_report_key(expected_report_key)
           return true
          elsif not seq and report_key.waiting_for_schedule_load?
            pending_since = schedule_report_keys[expected_report_key]['pending_since']
            if pending_since > 20.minutes.ago
              timeout_report_key(expected_report_key)
              return true
            end
          end
          schedule_report_keys[expected_report_key] = {'timedout': true, 'status': 'ready', 'seq': seq}
          save
          return false
        end
    end
end
