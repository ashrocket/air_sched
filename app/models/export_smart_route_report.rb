require 'oag/process'
require 'oag/exporters/smart_routes_exporter'


class ExportSmartRouteReport < ActiveRecord::Base
  belongs_to :brand
  include Workflow

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
      brand.data_states['route_maps_export'] = {'state': 'processing'}
      brand.save
      Rails.logger.info "#{brand.name}  Brand: -> confirming Import Reports are finished."

      # Kick of the Next Check or Transition
      brand.report_keys.each do |report_key|
        report = report_key.latest_report
        if report.blank?
          self.details['rejection_reason'] = "#{brand.name} Brand: #{report_key_code(report_key)} Report Key :  -> No Import Report exists !!!"
          save
          Rails.logger.info  self.details['rejection_reason']

          reject!
          halt
          return
        else
          # TODO:  Add Recovery Logic here.  What if it's a bad schedule load, check for earlier ones, or newer ones.
          #  At a minimum it should time out and die after an hour or two of waiting

          unless  report.finished?
            Rails.logger.info "#{brand.name} Brand:  #{report_key_code(report_key)} Report Key  -> Waiting for Import Report #{report.id} to complete ..."
            dly  = (30..120).to_a.sample
            ExportBrandRouteMapsWorker.delay_for(dly).perform_async(brand.brand_key, self.id)
            halt
            return
          end
          Rails.logger.info "#{brand.name} Brand:  #{report_key_code(report_key)} Report Key  -> Import Report #{report.id} ready ..."

        end

      end

      # If all latest reports from each report_key are in finished state, go ahead and transition 
      Rails.logger.info "#{brand.name} Brand:  -> Import Reports  complete."
      ExportBrandRouteMapsWorker.delay_for(30).perform_async(brand.brand_key, self.id)

    end
  
    def confirm_connections
      if  brand.processing_connections?
         Rails.logger.info "#{brand.name} :  -> Waiting for branded connections to complete ..."
         ExportBrandRouteMapsWorker.delay_for(2.minute).perform_async(brand.brand_key, self.id)
         halt
      else
         Rails.logger.info "#{brand.name} :  -> Branded connections  complete."
         ExportBrandRouteMapsWorker.delay_for(30).perform_async(brand.brand_key, self.id)
      end
    end
    def confirm_smart_routes
      if  brand.processing_smart_routes?
         Rails.logger.info "#{brand.name} :  -> Waiting for Smart Routes to complete ..."
         ExportBrandRouteMapsWorker.delay_for(2.minute).perform_async(brand.brand_key, self.id)
         halt
      else
         Rails.logger.info "#{brand.name} :  -> Smart Routes  complete."
         ExportBrandRouteMapsWorker.delay_for(30).perform_async(brand.brand_key, self.id)
      end
    end
    def confirm_route_maps
      if  brand.processing_route_maps?
         Rails.logger.info "#{brand.name} :  -> Waiting for Route Maps to complete ..."
         ExportBrandRouteMapsWorker.delay_for(2.minute).perform_async(brand.brand_key, self.id)
         halt
      else
         Rails.logger.info "#{brand.name} :  -> Route Maps complete."
         ExportBrandRouteMapsWorker.delay_for(30).perform_async(brand.brand_key, self.id)
      end
    end
  
  
    def build_connections
       Rails.logger.info "#{brand.name} :  -> Building Brand Connections - brand.processing_connections? #{brand.processing_connections?}"
    
       if  brand.processing_connections?
         Rails.logger.info "#{brand.name} :  -> Waiting for branded connections to complete ..."
         ExportBrandRouteMapsWorker.delay_for(2.minutes).perform_async(brand.brand_key,id)
         halt
       else
         UpdateBrandConnectionsWorker.delay_for(30).perform_async(brand.brand_key)
         # Transtion to the waiting for connections state
         dly = (30..120).to_a.sample
         ExportBrandRouteMapsWorker.delay_for(dly).perform_async(brand.brand_key,id)

        end
    end
    def build_smart_routes
      Rails.logger.info "#{brand.name} :  -> Building Smart Routes - brand.processing_smart_routes? #{brand.processing_smart_routes?}"
      
      if  brand.processing_connections?
        Rails.logger.info "#{brand.name} :  -> Waiting for smart routes to complete ..."
        ExportBrandRouteMapsWorker.delay_for(2.minutes).perform_async(brand.brand_key,id)
        halt
      else
        UpdateSmartRoutesWorker.delay_for(30).perform_async(brand.brand_key)
        # Transtion to the waiting for connections state
        dly = (30..120).to_a.sample
        ExportBrandRouteMapsWorker.delay_for(dly).perform_async(brand.brand_key,id)

       end
    end
    def build_route_maps
      Rails.logger.info "#{brand.name} :  -> Building Route Maps - brand.processing_route_maps? #{brand.processing_route_maps?}"
      
      if  brand.processing_route_maps?
        Rails.logger.info "#{brand.name} :  -> Waiting for Route Maps to complete ..."
        ExportBrandRouteMapsWorker.delay_for(2.minutes).perform_async(brand.brand_key,id)
        halt
      else
        UpdateRouteMapsWorker.delay_for(30).perform_async(brand.brand_key)
        dly = (30..120).to_a.sample
        ExportBrandRouteMapsWorker.delay_for(dly).perform_async(brand.brand_key,id)

        # Transtion to the waiting for connections state  
       end      
    end   


    def finalize
      Rails.logger.info "#{brand.name} :  -> Finalizing Route Map Export "
      
      exporter = Oag::SmartRoutesExporter.new
      url = exporter.export_to_s3(brand)
      self.location = url.to_s
      save
      brand.data_states['route_maps_export'] = {'state':'idle', 'location': self.location, 'updated_at': Time.now}
      brand.save

    end

    def reject
      brand.data_states['route_maps_export'] = {'state':'idle', 'error':'rejected', 'updated_at': Time.now}
      brand.save
    end

    #Helper Methods
    def report_key_code(report_key)
     report_key ? report_key.code : 'No Report Key Matched'
    end


end
