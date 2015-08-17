jQuery ->
#  $(".tooltip").tooltip()
#  $("a[rel=tooltip]").tooltip()
#  $(".alert").alert();
  $("a[rel=popover]").popover()
  $('[data-toggle="tooltip"]').tooltip()
  $('.btn').button();
#  $('.nav-tabs li a').tab();
#  $('.nav-tabs li.active a').tab('show');
  $('.dropdown-toggle').dropdown();
  $('.dropdown-toggle').dropdown();
    # Fix input element click problem
  $(".dropdown-menu input, .dropdown-menu label").click (e) ->
    e.stopPropagation()

