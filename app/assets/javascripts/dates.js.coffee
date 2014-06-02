#$ ->
#  $(("body.search_hub, body.search")[0]).ready ->
#
##    $("[data-behaviour~=datepicker]").datepicker
##             altFormat: "dd/mm/yyyy"
##             dateFormat: "mm-dd-yyyy"
##             format: "mm-dd-yyyy"
##             showAnim: "fold"
#    $("input[data-behaviour~=datepicker]").attr( 'readOnly' , 'true' );
#
#    nowTemp = new Date()
#    now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0)
#
#
#    nowTemp = new Date()
#    now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0)
#    departDate = $(".depart-datepicker[data-behaviour~=datepicker]").datepicker(
#      startDate: '+2d'
#      altFormat: 'dd/mm/yyyy'
#      dateFormat: 'mm-dd-yyyy'
#      format: 'mm-dd-yyyy'
#    ).on("changeDate", (ev) ->
#      rDate = $(".return-datepicker").datepicker('getDates')[0]
#      if rDate
#        if ev.date.valueOf() > rDate.valueOf()
#            newDate = new Date(ev.date)
#            newDate.setDate newDate.getDate() + 1
#            $(".return-datepicker").datepicker('setDate',newDate)
##          retDate.setValue newDate
#
#      $(".return-datepicker").datepicker('setStartDate',ev.date)
#
#      departDate.hide()
#      owrt = $('.search_request_owrt').find('input[checked="checked"]').val()
#      if owrt.eql? "RT"
#        $(".return-datepicker")[0].focus()
#      return
#    ).data("datepicker")
#    retDate = $(".return-datepicker[data-behaviour~=datepicker]").datepicker(
#      startDate: '+7d'
#      altFormat: 'dd/mm/yyyy'
#      dateFormat: 'mm-dd-yyyy'
#      format: 'mm-dd-yyyy'
#    ).on("changeDate", (ev) ->
#      retDate.hide()
#      return
#    ).data("datepicker")
#
#    return false
#
