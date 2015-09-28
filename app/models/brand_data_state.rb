class BrandDataState < ActiveRecord::Base
  belongs_to :brand
  include Workflow

  
  
  


  workflow do
    state :idle do
      event :build_connections, :transitions_to => :waiting_for_connections_build
      event :build_smart_routes, :transitions_to => :waiting_for_smart_routes_build
      event :build_route_maps, :transitions_to => :waiting_for_route_maps_build
      event :reset, :transitions_to => :idle
    end
    
    state :waiting_for_connections_build do
      event :confirm_connections, :transitions_to => :idle
      event :reset, :transitions_to => :idle
    end
    state :waiting_for_smart_routes_build do
      event :confirm_smart_routes, :transitions_to => :idle
      event :reset, :transitions_to => :idle
    end
    state :waiting_for_route_maps_build do
      event :confirm_route_maps, :transitions_to => :idle
      event :reset, :transitions_to => :idle
    end

  

    after_transition do |from, to, triggering_event, *event_args|
          stash_log "#{brand.brand_key} Event: #{triggering_event} transitioned FROM #{from} -> #{to}"
    end

    on_transition do |from, to, triggering_event, *event_args|
      stash_log "#{brand.brand_key} Event: #{triggering_event} transitioning FROM #{from} -> #{to}"
    end
  end


  def build_connections
    BrandDataProcessorWorker.perform_async(brand.brand_key, 'build_connections')
  end
  def build_smart_routes
      BrandDataProcessorWorker.perform_async(brand.brand_key, 'build_smart_routes')
  end
  def build_route_maps
      BrandDataProcessorWorker.perform_async(brand.brand_key, 'build_route_maps')
  end

 private
  def stash_log msg
      Rails.logger.info msg
      # brand.log_data << msg
      save
  end

end
