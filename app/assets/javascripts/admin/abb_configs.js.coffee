$ ->
  $("body.admin_dashboard").ready ->

    $("select").change (evt) ->
      $(evt.target).closest('form').submit()

    $('.btn-group#mode_button_group .btn input[checked]').closest('.btn').addClass('active')