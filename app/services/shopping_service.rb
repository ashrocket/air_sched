class ShoppingService

  def shop(search_request)
    search_request.include_direct = true

    search_results       = search_directs search_request
    if search_results[:directs] and search_results[:directs][:ob]
      search_results[:directs][:ob] = price_flight_segments search_results[:directs][:ob]
    end
    if search_results[:directs] and search_results[:directs][:rt]
      search_results[:directs][:rt] = price_flight_segments search_results[:directs][:rt]
    end

    search_results[:req] = search_request
    search_results
  end


  private

  def search_directs req


        o_flights = []
          #TODO:  this can be a method on the model
        o_flights =  OagSchedule.keyed(req.report_key)
                      .connecting(req.origin_code, req.dest_code).effective(req.depart)
                      .stops(req.stops).operating(req.depart).map{|s| s.to_flight req.depart}


        rt_flights = []
        if req.owrt.eql? "RT"
          rt_flights = OagSchedule.keyed(req.report_key)
                        .connecting(req.dest_code, req.origin_code).effective(req.ret_date)
                        .stops(req.stops).operating(req.ret_date).map { |s| s.to_flight req.ret_date}
        end
        directs = {ob: o_flights, rt: rt_flights}


        flight_options =  {directs: directs, one_hub_trips: {ob: [], rt: []}}
        flight_options
  end

  def price_flight_segments(segments)
    mock_prices = [45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.00, 100.00]
    mock_cents = [0.00, 0.49,0.99]
    segments.map! do |flight_segment|
        PricedFlightSegment.new(flight_segment, mock_prices.sample + mock_cents.sample)
    end
  end

end