jQuery ->
    loadDirectFlights = (origin_code) ->
      $.getJSON Routes.from_direct_flights_path(origin_code), (data_a) ->
         unless $jqxhr?
          pairs = data_a.dest_apts
          dest_apts = _.map pairs, (apt) ->
                        {dest_name: apt.dest_name, dest: apt.dest}
          dest_names = _.map dest_apts, (apt) ->
                        apt.dest_name

          _.each dest_names, (apt)->
            console.log "#{apt}"

          pnl = $("#direct_flights_panel")
          pnl_header = $("#direct_flights_panel_header")
          pnl_header.text('Arriving At')
          pnl.empty()
          origin_text = $('#direct_flight_origin').val()
          dest_apts = _.sortBy dest_apts, (apt) ->
            apt.dest_name
          search = new Object()
          search.maxct = 1560
          search.mct = 20
          search.origin_code = origin_code
          search.origin = origin_text
          while dest_apts.length > 0
            batch = dest_apts.splice(0, 4)
            row = $(document.createElement('div')).addClass("row")
            _.each batch, (apt)->
               col = $(document.createElement('div')).addClass("dest_airport").addClass("col-sm-3")
               params = {}

#               params[search_action] = jQuery.extend({}, search)

               href = Routes.search_path({origin_code: origin_code, dest_code: apt.dest,  format: '', trailing_slash: false})
               link = $(document.createElement('a'))
               link.prop('href', href)
               link.text(apt.dest_name + " (" + apt.dest + ")")
               col.append link
               row.append col
            pnl.append row
          console.log "Appened All the direct_flights"


    # -------------------------------
    # Twitter typeahead.js library calls
    # -------------------------------
    $(".explore-origin.typeahead").typeahead(
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
      $('#direct_flight_origin').data('origin-code', datum.code)
      loadDirectFlights(datum.code)
    ).on("typeahead:selected", (event, datum) ->
      $('#direct_flight_origin').data('origin-code', datum.code)
      loadDirectFlights(datum.code)
    )

    # ----------------------------
    # Delegated Click Event Handlers
    # ----------------------------
    $("body.direct_flights.explore").on 'click', '#trigger_direct_flights', (event) ->
       origin_code = $('#direct_flight_origin').data('origin-code')
       loadDirectFlights origin_code

    $("body.direct_flights.explore").on 'click', '.origin_airport', (event) ->
      origin_code = $(event.target).data('origin-apt-code')
      origin_name = $(event.target).data('origin-apt-name')
      $('.explore-origin.typeahead').typeahead('setQuery', origin_name)
      $('.explore-origin.typeahead').trigger('typeahead:selected', {"code": origin_code, "value": origin_name});


  # ----------------
  # End Jquery Ready block
  # ----------------

