class ExportSmartRouteReport < ActiveRecord::Base
  belongs_to :brand
  include Workflow

  validates :brand_id, presence: true

  scope :branded,      lambda {|brand|    where(brand: brand)}
  scope :latest, -> { order(updated_at: :desc).first}





  workflow do
    state :uninitialized do
      event :check_branded_connections, :transitions_to => :waiting_for_report_keys
      event :finalize, :transitions_to => :exported
      event :reject, :transitions_to => :rejected
    end
    state :waiting_for_report_keys do
      event :build_branded_connections, :transitions_to => :connections_built
      event :reject, :transitions_to => :rejected
    end
    state :connections_built do
      event :build_smart_routes, :transitions_to => :smart_routes_built
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
    end
    state :smart_routes_built do
       event :build_route_maps, :transitions_to => :route_maps_built
       event :reject, :transitions_to => :rejected
    end
    state :route_maps_built do
      event :finalize, :transitions_to => :exported
      event :reject, :transitions_to => :rejected
      event :reset, :transitions_to => :uninitialized
     end
    state :exported
    state :rejected

    after_transition do |from, to, triggering_event, *event_args|
       case to
         when /unitialized|exported|rejected/
           Rails.logger.info "#{self.id}: #{self.brand.name} #{triggering_event} transitioned FROM #{from} -> #{to}"
         else
           Rails.logger.info "#{self.id}: #{self.brand.name} #{triggering_event} transitioned FROM #{from} -> #{to} calling ExportWorker"
           ExportBrandRouteMapsWorker.perform_async(brand.brand_key, self.id)
       end
     end


    on_transition do |from, to, triggering_event, *event_args|
         Rails.logger.info "#{self.id}: #{self.brand.name} #{triggering_event} transitioning FROM #{from} -> #{to}"
    end
  end

  # Linear State Machine Advance method
    def advance_state!
      case current_state.name
        when /uninitialized/
          check_branded_connections!
        when /waiting_for_branded_connections/
          build_branded_connections!
        when /connections_built/
          build_smart_routes!
        when /smart_routes_built/
          build_route_maps!
        when /route_maps_built/
          finalize!
      end
    end


    def check_branded_connections
      brand.data_states['route_maps_export'] = 'processing'
      brand.save
      Rails.logger.info "#{brand.name}  -> checking if for report is finished."

      import_reports = brand.report_keys.map{ |rk| rk.latest_report}
      import_reports.each do |report|

        if report
            unless  report.finished?
              Rails.logger.info "#{brand.name} #{report.report_key.code} -> waiting for report #{report.id} to finish."
              ExportBrandRouteMapsWorker.delay_for(10.minute).perform_async(brand.brand_key, self.id)

              halt
            end
        else
          Rails.logger.info "#{brand.name} :  -> No Import Report exists !!!"
          reject!
        end
      end
    end

    def build_branded_connections
      UpdateBrandConnectionsWorker.perform_async(brand.brand_key)
    end

    def build_smart_routes
      UpdateSmartRoutesWorker.perform_async(brand.brand_key)
    end

    def build_route_maps
      UpdateRouteMapsWorker.perform_async(brand.brand_key)
    end

    def finalize
      exporter = Oag::SmartRoutesExporter.new
      url = exporter.export_to_s3(brand)
      self.location = url.to_s
      save
      brand.data_states['route_maps_export'] = 'idle'
      brand.save

    end



end
