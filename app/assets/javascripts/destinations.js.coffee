jQuery ->
    loadDestinations = (origin_code) ->
      $.getJSON "/cnx_pairs/" + origin_code, (data_a) ->
         unless $jqxhr?
          pairs = data_a.cnx_pairs
          dest_apts = _.map pairs, (apt) ->
                        {dest_name: apt.dest_name, dest: apt.dest}
          dest_names = _.map dest_apts, (apt) ->
                        apt.dest_name

          _.each dest_names, (apt)->
            console.log "#{apt}"

          pnl = $("#destinations_panel")
          pnl.empty()
          origin_text = $('#destination_origin').val()
          search_action = $('#destinations_panel').data('url')
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

               params[search_action] = jQuery.extend({}, search)

               href = "/" + search_action + "/" + origin_code + "/" + apt.dest
               link = $(document.createElement('a'))
               link.prop('href', href)
               link.text(apt.dest_name + " (" + apt.dest + ")")
               col.append link
               row.append col
            pnl.append row
          console.log "Appened All the destinations"


    # -------------------------------
    # Twitter typeahead.js library calls
    # -------------------------------
    $(".explore-origin.typeahead").typeahead(
      prefetch:
        url: '/airports/origins'
        filter: (data) ->
          retval = []
          i = 0

          while i < data.length
            (hints = _.str.words(data[i].value, /\W/)).push data[i].code
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
      $('#destination_origin').data('origin-code', datum.code)
      loadDestinations(datum.code)
    ).on("typeahead:selected", (event, datum) ->
      $('#destination_origin').data('origin-code', datum.code)
      loadDestinations(datum.code)
    )

    # ----------------------------
    # Delegated Click Event Handlers
    # ----------------------------
    $("body.destinations.explore").on 'click', '#trigger_destinations', (event) ->
       origin_code = $('#destination_origin').data('origin-code')
       loadDestinations origin_code




  # ----------------
  # End Jquery Ready block
  # ----------------

