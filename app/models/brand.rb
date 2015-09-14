class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :brand_key, use: [:slugged, :finders]

  has_many :brand_report_keys, dependent: :destroy
  has_many :report_keys,  -> { order(report_key: :asc) }, through: :brand_report_keys

  has_many :hosts, -> { order(name: :asc) }

  has_many :export_smart_route_reports, -> {order('export_smart_route_reports.updated_at DESC')}

  scope :keyed,     lambda {|brand_key| find_by(brand_key: brand_key)}

  # Class Methods
  class << self


  end

  #
  # Instance Methods
  #

  # Psuedo State Machine
  # TODO: Add a seperate StateMachine object for Sub State Machines,
  # Can't add state machine to Brand since state machien doesn't support sub-states
  def processing_connections?
    data_states['branded_connections'] and
    data_states['branded_connections']['state'] and
    data_states['branded_connections']['state'].eql? 'processing'
  end
  def processing_smart_routes?
    data_states['smart_routes'] and
    data_states['smart_routes']['state'] and
    data_states['smart_routes']['state'].eql? 'processing'
  end
  def processing_route_maps?
    data_states['route_maps'] and
    data_states['route_maps']['state'] and
    data_states['route_maps']['state'].eql? 'processing'
  end
  def processing_route_map_export?
    data_states['route_maps_export'] and
    data_states['route_maps_export']['state'] and
    data_states['route_maps_export']['state'].eql? 'processing'
  end
  def processing_route_map_validator_export?
    data_states['route_map_validator_export'] and
    data_states['route_map_validator_export']['state'] and
    data_states['route_map_validator_export']['state'].eql? 'processing'
  end
  def processing_potential_markets?
    data_states['potential_markets'] and
    data_states['potential_markets']['state'] and
    data_states['potential_markets']['state'].eql? 'processing'
  end
  def processing_potential_carriers?
    data_states['potential_carriers'] and
    data_states['potential_carriers']['state'] and
    data_states['potential_carriers']['state'].eql? 'processing'
  end
  def processing_potential_routes?
    data_states['potential_routes'] and
    data_states['potential_routes']['state'] and
    data_states['potential_routes']['state'].eql? 'processing'
  end

  def build_connections
    oag_reports = report_keys.map{ |rk| OagReport.keyed(rk.report_key).latest}
  end

  def hosts_for(cxrs)
     hosts.includes(:airlines).where(Airline[:code].in(cxrs)).references(:airlines)
   end

   def hostcodes_map
     h_m = Hash.new { |h, k| h[k] = Set.new }
     hosts.each do |h|
       h.carrier_codes.each do |cxr_code|
         h_m[cxr_code] <<  h.code
       end
     end
     h_m
   end

   def report_key_strings
     if  report_keys and report_keys.respond_to?(:first) and report_keys.first.is_a?(ReportKey)
         report_keys.map{|r| r.report_key}
     else
       ['']
     end
   end

   def all_possible_markets
     origins     = DirectFlight.branded(self).distinct(:origin).pluck(:origin)
     destination = DirectFlight.branded(self).distinct(:dest).pluck(:dest)
     origins.product destinations
   end
   def all_possible_carriers
     carrier_codes = OagSChedule.branded(self).distinct(:airline_code).distinct(:airline_code)
     carriers = Airline.where(code: carrier_codes)
   end

end