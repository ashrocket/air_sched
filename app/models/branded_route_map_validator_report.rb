require 'oag/process'
require 'oag/exporters/route_validator_exporter'


class BrandedRouteMapValidatorReport < ActiveRecord::Base
  belongs_to :brand
  include Workflow

  validates :brand_id, presence: true

  scope :branded,      lambda {|brand|    where(brand: brand)}
  scope :latest, -> { order(updated_at: :desc).first}





  workflow do
    state :uninitialized do
      event :confirm_route_maps_exported, :transitions_to => :route_map_confirmed
      event :finalize, :transitions_to => :exported
      event :reject, :transitions_to => :rejected
    end
    state :route_map_confirmed do
      event :build_implied_markets, :transitions_to => :implied_markets_built
      event :reject, :transitions_to => :rejected
    end
    state :implied_markets_built do
      event :validate_markets, :transitions_to => :markets_validated
      event :reject, :transitions_to => :rejected
    end
    state :markets_validated do
      event :finalize, :transitions_to => :exported
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
     end
    state :exported
    state :rejected

   
    on_transition do |from, to, triggering_event, *event_args|
         Rails.logger.info "Route Map Validation (#{brand.brand_key}) : #{self.id}: #{self.brand.name} Brand: Event #{triggering_event} transitioning FROM #{from} -> #{to}"
    end
  end

  # Linear State Machine Advance method
    def advance_state!
      case current_state.name
        when /uninitialized/
          confirm_route_maps_exported!
        when /route_map_confirmed/
          build_implied_markets!
        when /implied_markets_built/
          validate_markets!
        when /markets_validated/
          finalize!
      end
    end


    # TODO: Add Waiting for ReportKey Reports to Complete State, to provide more visibility into the process
    def confirm_route_maps_exported
      Rails.logger.info "Route Map Validation (#{brand.brand_key}) : -> confirming Route Map Export Report is ready and valid finished."


      latest_export = brand.route_map_export_reports.latest
      unless latest_export and latest_export.exported?
         self.details['rejection_reason'] = "Route Map Validation (#{brand.brand_key}) : Latest Route Map Export is not in 'exported' state."
         save
         Rails.logger.info  self.details['rejection_reason']
         reject!
         halt
         return
      end

      Rails.logger.info "Route Map Validation (#{brand.brand_key}) : Export Report #{latest_export.id} is ready ..."
      BrandRouteMapValidatorExportWorker.delay_for(15).perform_async(brand.brand_key, self.id)

    end


    def build_implied_markets
      origins = brand.origins.pluck(:origin_apt).sort
      destinations = brand.destinations.pluck(:dest_apt).sort
      r = Oag::Report.new
      r.build_implied_markets(brand, origins, destinations)
      Rails.logger.info "Route Map Validation (#{brand.brand_key}) : implied markets built"
      BrandRouteMapValidatorExportWorker.delay_for(15).perform_async(brand.brand_key, self.id)
    end


    def validate_markets

      r = Oag::Report.new
      r.build_route_map_validations(brand)

      Rails.logger.info "Route Map Validation (#{brand.brand_key}) :  -> Branded Implied Markets validated."
      BrandRouteMapValidatorExportWorker.delay_for(15).perform_async(brand.brand_key, self.id)
    end



    def finalize
      Rails.logger.info "#{brand.name} :  -> Finalizing Route Validator Export "
      
      exporter = Oag::RouteMapValidatorExporter.new
      url = exporter.export_to_s3(brand)
      self.location = url.to_s
      brand.export_state.reset!
      brand.data_state.stats['route_maps_validator_export'] = {'location': self.location, 'updated_at': DateTime.now.in_time_zone }
      brand.save


    end
    def reject
       brand.export_state.reset!
       brand.data_state.stats['route_maps_validator_export'] = {'error':'rejected', 'updated_at': DateTime.now.in_time_zone }
       brand.save
    end




end
