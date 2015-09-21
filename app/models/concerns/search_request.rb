class SearchRequest
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming


    attr_accessor :report_key, :report_key_id, :join, :owrt
    attr_accessor :cxrs
    attr_accessor :origin, :origin_id, :origin_code
    attr_accessor :dest, :dest_id, :dest_code
    attr_accessor :depart,:ret_date
    attr_accessor :mct, :maxct
    attr_accessor :stops
    attr_accessor :include_direct




    validates :report_key, :owrt, :origin_code, :dest_code, :depart, presence: true
    #validates_format_of :mode,  :with => /\AHUB|CXX\z/
    validates_format_of :origin_code, :dest_code,   :with => /\A[A-Z]{3}\z/
    validates_length_of :origin_code, :dest_code, :maximum => 3

    # Ensure the expiration date is after the packaging date
    #validates :ret_date, date: { after: :depart }, if: Proc.new { |o| o.ret_date.is_a? Date }

    def initialize(attributes = {})
      @join = false
      @include_direct = false
      @owrt     = "OW"
      @mct   = ABBConfig.mct.to_i
      @stops = 0
      @maxct = ABBConfig.maxct.to_i
      attributes.each do |name, value|
        send("#{name}=", value) if respond_to? "#{name}="
      end

      @stops = @stops.to_i
      @mct        = @mct.to_i
      @maxct      = @maxct.to_i
      @maxct      = 600 if @maxct < 120
      deduce_origin_data
      deduce_dest_data
      # Dates, should be dates
      @depart    = Chronic.parse(@depart).to_date unless @depart.blank?
      @depart    = (Date.today + 1.week) if @depart.blank?
      @ret_date  = Chronic.parse(@ret_date).to_date unless @ret_date.blank?
      @cxrs = OagSchedule.carriers_for_key(attributes[:report_key]) if @cxrs.blank?


    end

    def include_direct?
      @include_direct
    end

    private
    def ret_date_is_date
      @ret_date.class.is_a? Date
    end
    def deduce_origin_data
      unless @origin_code.blank?
        @origin_code = @origin_code.upcase
        if @origin_id.blank? or @origin.blank?
          apt = Airport.cached @origin_code
          @origin_id = apt.id
          @origin = apt.disp_name
        end
      end
    end
    def deduce_dest_data
      unless @dest_code.blank?
        @dest_code = @dest_code.upcase
        if @dest_id.blank? or @dest.blank?
          apt = Airport.cached @dest_code
          @dest_id = apt.id
          @dest = apt.disp_name
        end
      end
    end
end



