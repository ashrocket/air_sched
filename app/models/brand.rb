class Brand < ActiveRecord::Base
  extend FriendlyId
  before_create :build_defaults



  friendly_id :brand_key, use: [:slugged, :finders]

  has_one :settings, class_name: 'BrandSetting',  dependent: :destroy
  has_one :data_state, class_name: 'BrandDataState', dependent: :destroy
  has_one :export_state, class_name: 'BrandExportState', dependent: :destroy

  has_many :brand_report_keys, dependent: :destroy
  has_many :report_keys,  -> { order(code: :asc) }, through: :brand_report_keys


  has_many :hosts, -> { order(name: :asc) }
  has_many :route_map_export_reports,  -> {order('brand_route_map_export_reports.updated_at DESC')}, class_name: 'BrandRouteMapExportReport'

  scope :keyed,     lambda {|brand_key| find_by(brand_key: brand_key)}


  accepts_nested_attributes_for :settings, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :settings

  # Class Methods
  class << self


  end



  #
  # Instance Methods
  #

  def origins
    current_schedules.select(:origin_apt).distinct
  end


  def schedule_set_ids
    report_keys.map{|rk| rk.current_schedule_set_id  }
  end
  def current_schedules
    OagSchedule.branded(self).where(schedule_set_id: schedule_set_ids)
  end



  def next_export_report
    Rails.logger.info "Brand #{brand_key} - Creating New Export Report"
    rpt = route_map_export_reports.create
    save
    return rpt
  end

  def active_export_report
    active_report = nil
    export_reports = route_map_export_reports.in_progress.sort_by{|r| r.updated_at}.reverse
    unless export_reports.empty?
      active_report = export_reports.first
    end
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



  private
  def build_defaults
    # build default data_state instance. Will use default params.
    # The foreign key to the owning Brand model is set automatically
    build_data_state
    true
    build_export_state
    true
    build_settings
    true
    # Always return true in callbacks as the normal 'continue' state
         # Assumes that the data_state can **always** be created.
         # or
         # Check the validation of the data_state. If it is not valid, then
         # return false from the callback. Best to use a before_validation
         # if doing this. View code should check the errors of the child.
         # Or add the child's errors to the User model's error array of the :base
         # error item
  end


end