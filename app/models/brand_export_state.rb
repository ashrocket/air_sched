class BrandExportState < ActiveRecord::Base
  belongs_to :brand
  include Workflow






  workflow do
    state :idle do
      event :auto_export_route_maps, :transitions_to => :waiting_for_route_map_export
      event :export_markets, :transitions_to => :waiting_for_markets_export
      event :reset, :transitions_to => :idle
    end

    state :waiting_for_route_map_export do
      event :confirm_route_map_export, :transitions_to => :idle
      event :reset, :transitions_to => :idle
    end
    state :waiting_for_markets_export do
      event :confirm_markets_export, :transitions_to => :idle
      event :reset, :transitions_to => :idle
    end



    after_transition do |from, to, triggering_event, *event_args|
           stash_log "#{brand.brand_key} Event: #{triggering_event} transitioned FROM #{from} -> #{to}"
     end

     on_transition do |from, to, triggering_event, *event_args|
       stash_log "#{brand.brand_key} Event: #{triggering_event} transitioning FROM #{from} -> #{to}"
     end
  end


  def auto_export_route_maps(export_report)
    BrandRouteMapsExportWorker.delay_for(5).perform_async(brand.brand_key, export_report.id)
  end

  def export_markets
    BrandDataProcessorWorker.perform_async(brand.brand_key, 'export_markets')
  end

  private
    def stash_log msg
        Rails.logger.info msg
        # brand.log_data << msg
        save
    end

  end

