jQuery.extend jQuery.fn.dataTableExt.oSort,
  "file-size-pre": (a) ->
    x = a.substring(0, a.length - 2)
    x_unit = ((if a.substring(a.length - 2, a.length) is "MB" then 1000 else ((if a.substring(a.length - 2, a.length) is "GB" then 1000000 else 1))))
    parseInt x * x_unit, 10

  "file-size-asc": (a, b) ->
    (if (a < b) then -1 else ((if (a > b) then 1 else 0)))

  "file-size-desc": (a, b) ->
    (if (a < b) then 1 else ((if (a > b) then -1 else 0)))

jQuery.fn.dataTableExt.aTypes.unshift (sData) ->
  sValidChars = "0123456789"
  Char = undefined
  return null unless typeof sData is "string"
  # Check the numeric part
  i = 0
  while i < (sData.length - 3)
    Char = sData.charAt(i)
    return null  if sValidChars.indexOf(Char) is -1
    i++

  # Check for size unit KB, MB or GB
  return "file-size"  if sData.substring(sData.length - 2, sData.length) is "KB" or sData.substring(sData.length - 2, sData.length) is "MB" or sData.substring(sData.length - 2, sData.length) is "GB"
  null
