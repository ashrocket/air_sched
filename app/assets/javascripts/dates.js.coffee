$ ->
  $(("body.search")[0]).ready ->

#    $("[data-behaviour~=datepicker]").datepicker
#             altFormat: "dd/mm/yyyy"
#             dateFormat: "mm-dd-yyyy"
#             format: "mm-dd-yyyy"
#             showAnim: "fold"
    $("input[data-behaviour~=datepicker]").attr( 'readOnly' , 'true' );

    nowTemp = new Date()
    now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0)


    nowTemp = new Date()
    now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0)
    departDate = $(".depart-datepicker[data-behaviour~=datepicker]").datepicker(
      startDate: '+2d'
      altFormat: 'dd/mm/yyyy'
      dateFormat: 'mm-dd-yyyy'
      format: 'mm-dd-yyyy'
    ).on("changeDate", (ev) ->
      rDate = $(".return-datepicker").datepicker('getDates')[0]
      if rDate
        if ev.date.valueOf() > rDate.valueOf()
            newDate = new Date(ev.date)
            newDate.setDate newDate.getDate() + 1
            $(".return-datepicker").datepicker('setDate',newDate)
#          retDate.setValue newDate

      $(".return-datepicker").datepicker('setStartDate',ev.date)

      departDate.hide()
      owrt = $('.search_request_owrt').find('input[checked="checked"]').val()
      if owrt.eql? "RT"
        $(".return-datepicker")[0].focus()
      return
    ).data("datepicker")
    retDate = $(".return-datepicker[data-behaviour~=datepicker]").datepicker(
      startDate: '+7d'
      altFormat: 'dd/mm/yyyy'
      dateFormat: 'mm-dd-yyyy'
      format: 'mm-dd-yyyy'
    ).on("changeDate", (ev) ->
      retDate.hide()
      return
    ).data("datepicker")

    return false

#    departDate = $(".depart-datepicker").datepicker(
#      dateFormat: "mm-dd-yyyy",
#      showAnim: "fold",
#      format: "mm-dd-yyyy",
#      onRender: (date) ->
#      (
#        if date.valueOf() < now.valueOf() then "disabled" else "")
#      ).on("changeDate", (ev) ->
#        if ev.date.valueOf() > retDate.date.valueOf()
#          newDate = new Date(ev.date)
#          newDate.setDate newDate.getDate() + 1
#          retDate.setValue newDate
#        departDate.hide()
#        if $(input.owrt).eql? "RT"
#          $(".return-datepicker")[0].focus()
#    ).data("datepicker")
#
#    retDate = $(".return-datepicker").datepicker(
#      dateFormat: "mm-dd-yyyy",
#      showAnim: "fold",
#      format: "mm-dd-yyyy",
#      onRender: (date) -> # Type here!
#      (
#        if date.valueOf() <= departDate.date.valueOf() then "disabled" else "")
#      ).on("changeDate", (ev) ->
#      retDate.hide()
#    ).data("datepicker")



#    Widget =
#          hide: ->
#            @element.animate
#              opacity: 0.0
#              top: -10
#
#
#          show: ->
#            @element.animate
#              opacity: 1.0
#              top: 0
#
#
#          element: $(".widget")
