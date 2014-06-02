jQuery.extend jQuery.fn.dataTableExt.oSort,
  "datetime-us-pre": (a) ->
    b = a.match(/(\d{1,2})\/(\d{1,2})\/(\d{2,4}) (\d{1,2}):(\d{1,2}) (am|pm|AM|PM|Am|Pm)/)
    month = b[1]
    day = b[2]
    year = b[3]
    hour = b[4]
    min = b[5]
    ap = b[6]
    hour = "0"  if hour is "12"
    hour = parseInt(hour, 10) + 12  if ap is "pm"
    if year.length is 2
      if parseInt(year, 10) < 70
        year = "20" + year
      else
        year = "19" + year
    month = "0" + month  if month.length is 1
    day = "0" + day  if day.length is 1
    hour = "0" + hour  if hour.length is 1
    min = "0" + min  if min.length is 1
    tt = year + month + day + hour + min
    tt

  "datetime-us-asc": (a, b) ->
    a - b

  "datetime-us-desc": (a, b) ->
    b - a

jQuery.fn.dataTableExt.aTypes.unshift (sData) ->
  return "datetime-us"  if sData isnt null and sData.toString().match(/\d{1,2}\/\d{1,2}\/\d{2,4} \d{1,2}:\d{1,2} (am|pm|AM|PM|Am|Pm)/)
  null
