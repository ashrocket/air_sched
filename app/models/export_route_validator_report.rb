require 'oag/process'
require 'oag/exporters/route_validator_exporter'


class ExportRouteValidatorReport < ActiveRecord::Base
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
    state :building_potential_markets do
      event :confirm_potential_markets, :transitions_to => :potential_markets_built
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :potential_markets_built do
      event :build_potential_carriers, :transitions_to => :building_potential_carriers
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :building_potential_carriers do
      event :confirm_potential_carriers, :transitions_to => :potential_carriers_built
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :potential_carriers_built do
      event :build_potential_routes, :transitions_to => :building_potential_routes
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :building_potential_routes do
      event :confirm_potential_routes, :transitions_to => :potential_routes_built
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :potential_routes_built do
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
          build_potential_markets!
        when /building_potential_markets/
          confirm_potential_markets!
        when /potential_markets_built/
          build_potential_carriers!
        when /building_potential_carriers/
          confirm_potential_carriers!
        when /potential_carriers_built/
          build_potential_routes!
        when /building_potential_routes/
          confirm_potential_routes!
        when /potential_routes_built/
          finalize!
      end
    end


    # TODO: Add Waiting for ReportKey Reports to Complete State, to provide more visibility into the process
    def confirm_report_keys
      brand.data_states['route_map_validator_export'] = {'state':'processing'}
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
            ExportBrandRouteMapValidatorWorker.delay_for(dly).perform_async(brand.brand_key, self.id)
            halt
            return
          end
          Rails.logger.info "#{brand.name} Brand:  #{report_key_code(report_key)} Report Key  -> Import Report #{report.id} ready ..."

        end

      end

      # If all latest reports from each report_key are in finished state, go ahead and transition 
      Rails.logger.info "#{brand.name} Brand:  -> Import Reports  complete."
      ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key, self.id)

    end
  
    def confirm_potential_markets
      if  brand.processing_potential_markets?
         Rails.logger.info "#{brand.name} :  -> Waiting for Potential Markets  to complete ..."
         ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key, self.id)
         halt
      else
         Rails.logger.info "#{brand.name} :  -> Branded Potential Markets complete."
         ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key, self.id)
      end
    end
    def confirm_potential_carriers
      if  brand.processing_potential_carriers?
         Rails.logger.info "#{brand.name} :  -> Waiting for Potential Carriers to complete ..."
         ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key, self.id)
         halt
      else
         Rails.logger.info "#{brand.name} :  -> Potential Carriers complete."
         ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key, self.id)
      end
    end
    def confirm_potential_routes
      if  brand.processing_potential_routes?
         Rails.logger.info "#{brand.name} :  -> Waiting for Potential Routes to complete ..."
         ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key, self.id)
         halt
      else
         Rails.logger.info "#{brand.name} :  -> Potential Routes complete."
         ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key, self.id)
      end
    end
  
  
    def build_potential_markets
       Rails.logger.info "#{brand.name} :  -> Building Potential Markets - brand.processing_potential_markets? #{brand.processing_potential_markets}"
    
       if  brand.processing_potential_markets?
         Rails.logger.info "#{brand.name} :  -> Waiting for Potential Markets to complete ..."
         ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key,id)
         halt
       else
         UpdateBrandConnectionsWorker.delay_for(30).perform_async(brand.brand_key)
         # Transtion to the waiting for connections state
         dly = (5..30).to_a.sample
         ExportBrandRouteMapValidatorWorker.delay_for(dly).perform_async(brand.brand_key,id)

        end
    end
    def build_potential_carriers
      Rails.logger.info "#{brand.name} :  -> Building Potential Carriers - brand.processing_potential_carriers? #{brand.processing_potential_carriers?}"
      
      if  brand.processing_potential_carriers?
        Rails.logger.info "#{brand.name} :  -> Waiting for Potential Carriers to complete ..."
        ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key,id)
        halt
      else
        UpdateSmartRoutesWorker.delay_for(30).perform_async(brand.brand_key)
        # Transtion to the waiting for connections state
        dly = (5..30).to_a.sample
        ExportBrandRouteMapValidatorWorker.delay_for(dly).perform_async(brand.brand_key,id)

       end
    end
    def build_potential_routes
      Rails.logger.info "#{brand.name} :  -> Building Potential Routes - brand.processing_potential_routes? #{brand.processing_potential_routes?}"
      
      if  brand.processing_potential_routes?
        Rails.logger.info "#{brand.name} :  -> Waiting for Potential Routes to complete ..."
        ExportBrandRouteMapValidatorWorker.delay_for(30).perform_async(brand.brand_key,id)
        halt
      else
        UpdateRouteMapsWorker.delay_for(30).perform_async(brand.brand_key)
        dly = (5..30).to_a.sample
        ExportBrandRouteMapValidatorWorker.delay_for(dly).perform_async(brand.brand_key,id)

        # Transition to the waiting for connections state
       end      
    end   


    def finalize
      Rails.logger.info "#{brand.name} :  -> Finalizing Route Validator Export "
      
      exporter = Oag::RouteValidatorExporter.new
      url = exporter.export_to_s3(brand)
      self.location = url.to_s
      save
      brand.data_states['route_map_validator_export'] = {'state':'idle', 'location': self.location, 'updated_at': Time.now}
      brand.save

    end

    def reject
      brand.data_states['route_map_validator_export'] = {'state':'idle', 'error':'rejected', 'updated_at': Time.now}
      brand.save
    end

    #Helper Methods
    def report_key_code(report_key)
     report_key ? report_key.code : 'No Report Key Matched'
    end


end
