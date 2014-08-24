module SearchHelper
  def validate_request params
    Rails.logger.info params
    search = params["search"]
    #let's hack some params
    search["origin"] = search[:origin_code]
    search["dest"]   = search[:dest_code]

    search[:mct]    = (search and search[:mct]) ? search[:mct].to_i : 20
    search[:maxct] = (search and search[:maxct]) ? search[:maxct].to_i : 1560
    search[:maxct] = 600 if search[:maxct] < 120
    search[:owrt]   = "OW" unless search[:owrt]
    Rails.logger.info search
    search
  end
  def owrt_collection
    [{val: "OW", name:"One Way"},{val: "RT", name:"RoundTrip"}]
  end

end
