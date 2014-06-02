jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $(".alert").alert();
  $('.btn').button();
#  $('.nav-tabs li a').tab();
#  $('.nav-tabs li.active a').tab('show');
  $('.dropdown-toggle').dropdown();
  $('.dropdown-toggle').dropdown();
    # Fix input element click problem
  $(".dropdown-menu input, .dropdown-menu label").click (e) ->
    e.stopPropagation()

