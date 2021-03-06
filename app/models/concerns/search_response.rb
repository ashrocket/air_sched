class SearchResponse
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :ob,:rt, :joined, :directs


    def initialize(attributes = {})
      @ob = []
      @rt = []
      @joined = []
      one_hub_results = attributes[:one_hub_trips]
      outbound_results = one_hub_results[:ob].is_a?(Array)  ? one_hub_results[:ob] : []
      return_results   = one_hub_results[:rt].is_a?(Array)  ? one_hub_results[:rt] : []

      outbound_results.each{|res| @ob << ResultSet.new(res)  }
      return_results.each{|res| @rt << ResultSet.new(res)  }
      @ob.each do |ob_result|
        ob_result.errors.each{|err|  errors << error}
      end
      @rt.each do |rt_result|
        rt_result.errors.each{|err| errors << err}
      end


    end



    def join_result
        outbound_journeys = []
        return_journeys = []
         @ob.each do |res|
           outbound_journeys = outbound_journeys + join_journeys(res.journeys)
         end
        @rt.each do |res|
          outbound_journeys = outbound_journeys + join_journeys(res.journeys)
        end
        @joined = return_journeys.blank? ? outbound_journeys : outbound_journeys.product(return_journeys)

         self
    end

  private

    def join_journeys journeys
      joined_results = []
        journeys.f.each do |flt|
          journeys.xmap[flt.id].each do |valid_cnx_id|
            valid_cnx_flt = res.journeys.x.find{|x| x.id.eql? valid_cnx_id}
            joined_results << JoinedJourney.new(f: flt, cnx: valid_cnx_flt, hub: res[:hub]) if valid_cnx_flt

          end
        end
        joined_results
    end

end



