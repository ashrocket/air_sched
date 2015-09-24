# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("body.search").ready ->

    renderHubs = (airports) ->
      $('#hub_content').empty()
      $('#hub_content').append "<ul class='nav'></ul>"
      if airports.length > 1
        _.each airports, (airport)->
             html_data = "<li><a class='hub-link' href='#' data-hub-code-id='" + airport.id  + "'" +
             " data-hub-code='" + airport.code + "'> #{airport.name} (#{airport.code})</a></li>"
             $('#hub_content').append html_data
        $('#hub_modal').modal('show')
      else
        hub_code = airports[0].code
        origin_code = $('#search_request_origin').data('origin-code')
        dest_code = $('#search_request_dest').data('dest-code')

        $('#hub_modal').modal('hide')
        loadToHubSchedule(origin_code, dest_code )
        loadFromHubSchedule(dest_code,origin_code  )



    renderToHubSchedules = (schedules) ->
      toHubTable.fnClearTable()
      $('#to_hub_table').closest('.table-responsive').removeClass('hide')

      _.each schedules, (schedule)->
        toHubTable.fnAddData(
             [ schedule.eff_date,
               schedule.disc_date,
               schedule.origin_apt,
               schedule.dest_apt,
               schedule.airline_code,
               schedule.flight_num,
               schedule.dep_time_local,
               schedule.arr_time_local,
               schedule.dep_op_days,
               schedule.stops]
         )

    renderFromHubSchedules = (schedules) ->

      fromHubTable.fnClearTable()
      $('#from_hub_table').closest('.table-responsive').removeClass('hide')
      _.each schedules, (schedule)->
        fromHubTable.fnAddData(
             [ schedule.eff_date,
               schedule.disc_date,
               schedule.origin_apt,
               schedule.dest_apt,
               schedule.airline_code,
               schedule.flight_num,
               schedule.dep_time_local,
               schedule.arr_time_local,
               schedule.dep_op_days,
               schedule.stops]
         )




    loadToHubSchedule = (o, d) ->
      $jqxhr = null
      $.getJSON(Routes.markets_oag_schedules_path(o,d), (schedules) ->
        unless $jqxhr?
          if schedules.length > 0
            renderToHubSchedules(schedules)

          else
            alert("We couldn't find any schedules  for this pair")


      ).fail (jqXHR, textStatus, errorThrown) ->

    loadFromHubSchedule = (o, d) ->
      $jqxhr = null
      $.getJSON(Routes.markets_oag_schedules_path(o,d), (schedules) ->
        unless $jqxhr?
          if schedules.length > 0
            renderFromHubSchedules(schedules)

          else
            cxx = $("#search_request_mode_key").val()
            alert("We couldn't find any schedules from #{o} to #{d} using #{cxx}")


      ).fail (jqXHR, textStatus, errorThrown) ->


    loadHubs = (o,d) ->
      $jqxhr = null
      $.getJSON(Routes.hubs_destinations_path(o,d), (airports) ->
        unless $jqxhr?
          if airports.length > 0
            renderHubs(airports)

          else
            cxx = $("#search_request_mode_key").val()
            alert("We couldn't find any 1 stop connections from #{o} to #{d} using #{cxx}")


      ).fail (jqXHR, textStatus, errorThrown) ->










    $("#flight_search_form").on "ajax:success", (data, textStatus, jqXHR) ->
    $("#flight_search_form").on "ajax:complete", (data, textStatus, jqXHR) ->


    toHubTable = $("#to_hub_table").dataTable
       bFilter: false
       iDisplayLength: 50
       aaSorting: [[ 2, "desc" ]]
       aoColumns: [{ "sType": "date" },{"sType": "date" },
                    null,null,null,null,{"sType": "integer" },{"sType": "integer" },null, null]

    fromHubTable = $("#from_hub_table").dataTable
       bFilter: false
       iDisplayLength: 50
       aaSorting: [[ 2, "desc" ]]
       aoColumns: [{ "sType": "date" },{"sType": "date" },
                    null,null,null,null,{"sType": "datetime-us" },{"sType": "datetime-us" },null, null]


    # -------------------------------
    # Twitter typeahead.js library calls
    # -------------------------------
    dest_prefetch = {
      url: Routes.origins_airports_path()
      cache: false
      replace: (url, uriEncodedQuery) ->
        apt = $('#search_request_origin_code').val()
        apt_url = if apt then "/" + apt else ''
        '/airports' + apt_url + "/dest/" + uriEncodedQuery
      filter: (data) ->
        retval = []
        i = 0

        while i < data.length
          (hints = _.words(data[i].value)).push data[i].code
          retval.push
            value: data[i].value
            tokens: hints
            code: data[i].code
          i++
        retval
    }
    update_dest_selection = (datum) ->
      $('#search_request_dest').val("#{datum.code} - #{datum.value}")
      $('#search_request_dest').data('dest-code', datum.code)
      $('#search_request_dest').data('dest-name', datum.value)
      $('#search_request_dest_code').val(datum.code)

      console.log "Updated Dest Typeahead Selection: #{datum.code}"

    update_origin_selection = (datum) ->
      $('#search_request_origin').val("#{datum.code} - #{datum.value}")
      $('#search_request_origin').data('origin-code', datum.code)
      $('#search_request_origin').data('origin-name', datum.value)
      $('#search_request_origin_code').val(datum.code)
      $('#search_request_origin')[0].setSelectionRange(0, 0);
      console.log "Updated Origin Typeahead Selection: #{datum.code}"
      $(".search-dest.typeahead").typeahead('destroy')

      $(".search-dest.typeahead").typeahead(
         prefetch: dest_prefetch
         template: '<p><i class="fa fa-plane"></i>  {{value}} ({{code}})</p>'
         engine: Hogan
         limit: 100
       ).on("typeahead:autocompleted", (event, destdatum) ->
          update_dest_selection(destdatum)
       ).on("typeahead:selected", (event, destdatum) ->
          update_dest_selection(destdatum)
       )


    $(".search-origin.typeahead").typeahead(
      prefetch:
        url: Routes.origins_airports_path()
        filter: (data) ->
          retval = []
          i = 0

          while i < data.length
            (hints = _.words(data[i].value)).push data[i].code
            retval.push
              value: data[i].value
              tokens: hints
              code: data[i].code
            i++
          retval
      template: '<p><i class="fa fa-plane"></i>  {{value}} ({{code}})</p>'
      engine: Hogan
      limit: 10
    ).on("typeahead:autocompleted", (event, datum) ->
        update_origin_selection(datum)
    ).on("typeahead:selected", (event, datum) ->
        update_origin_selection(datum)
    ).on('change', ->
        $(this).trigger('typeahead:_changed')
    ).on('typeahead:_changed', ->
        console.log('typeahead:_changed')
        # This event is always triggered before 'typeahead:_done', so you have a
        # chance to set a variable/property to indicate the value is dirty.
    ).on('typeahead:_done', (evt, object, datum) ->
        console.log('typeahead:_done')
        # This event is triggered ONLY when the user selects or autocompletes
        # with an entry from the suggestions.
    )


#    $(".search-dest.typeahead").typeahead(
#      prefetch: dest_prefetch
#      template: '<p><i class="fa fa-plane"></i>  {{value}} ({{code}})</p>'
#      engine: Hogan
#      limit: 100
#    ).on "selected, typeahead:autocompleted", (event, datum) ->
#      $('#search_request_dest').data('dest-code', datum.code)
#      $('#search_request_dest_code').val(datum.code)



    $('form.simple_form .btn input[checked=checked]').closest('.btn').addClass 'active'


    #------------------------
    # Jquery event handlers
    #------------------------
    $("input[name='search_request[owrt]']").change (event) ->
      $input = $(event.target)
      if $input.val() is "OW"
        console.log('saving old value of ret_date')
        ret_date = $('#search_request_ret_date').val()
        $('#search_request_ret_date').data('prevDate', ret_date)
        $('#search_request_ret_date').val('')
      else if $input.val() is "RT"
        ret_date = $('#search_request_ret_date').data('prevDate')
        $('#search_request_ret_date').val(ret_date) if Date.parse ret_date

    $("#search_request_ret_date").change (event) ->
      ret_date = $(event.target)
      if Date.parse ret_date.val()
        $('#search_request_ret_date').data('prevDate', ret_date)
        $('.search_request_owrt input#search_request_owrt_rt').trigger('click')

    # ----------------------------
    # Delegated Click Event Handlers
    # ----------------------------
    $("body.search").on 'click', 'a#reverse_pair', (evt) ->

      dest_code = $('#search_request_origin').data('origin-code')
      dest_name = $('#search_request_origin').data('origin-name')
      unless dest_code?
        dest_code = $('#search_request_origin_code').val()
      unless dest_name?
        dest_code = $('#search_request_origin').val()

      dest_datum  = {code: dest_code, value: dest_name }

      origin_code   = $('#search_request_dest').data('dest-code')
      origin_name   = $('#search_request_dest').data('dest-name')
      unless origin_code?
        origin_code   = $('#search_request_dest_code').val()
      unless origin_name?
        origin_code   = $('#search_request_dest').val()
      $('#search_request_origin').data('origin-code', origin_code)
      $('#search_request_origin').data('origin-name', origin_name)
      origin_datum = {code: origin_code, value: origin_name }

      update_origin_selection(origin_datum)
      update_dest_selection (dest_datum)
      $('.search-origin.typeahead').typeahead('setQuery', "#{origin_datum.code} - #{origin_datum.value}")
      $('.search-dest.typeahead').typeahead('setQuery', "#{dest_datum.code} - #{dest_datum.value}")


    $("body.search").on 'click', 'a#analyze_pair', (evt) ->

      origin_code = $('#search_request_origin').data('origin-code')
      unless origin_code?
        origin_code = $('#search_request_origin_code').val()
        $('#search_request_origin').data('origin-code', origin_code)

      dest_code   = $('#search_request_dest').data('dest-code')
      unless dest_code?
        dest_code   = $('#search_request_dest_code').val()
        $('#search_request_dest').data('dest-code', dest_code)


#     Only Show Direct Schedules for Now
      if origin_code and dest_code
        loadToHubSchedule(origin_code, dest_code )
        loadFromHubSchedule(dest_code,origin_code)
#        loadHubs(origin_code, dest_code)
      else
        alert("Both Origin and Destination must be specified")

    $("body.search").on 'click', '.hub-link', (evt) ->
      hub_code = $(evt.target).data('hub-code')
      origin_code = $('#search_request_origin').data('origin-code')
      dest_code = $('#search_request_dest').data('dest-code')

      $('#hub_modal').modal('hide')
      loadToHubSchedule(origin_code, hub_code )
      loadFromHubSchedule(hub_code,dest_code  )

  # ----------------
  # End Jquery Ready block
  # ----------------


