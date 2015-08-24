$ ->
  $("body.admin_dashboard").ready ->

    $("form#set_current_data_key_form").on("ajax:success", (e, data, status, xhr) ->
      $("form#set_current_data_key_form select").addClass('success-change')
    ).on "ajax:error", (e, xhr, status, error) ->
      $("form#set_current_data_key_form select").addClass('fail-change').append("<p>ERROR</p>")

    $("form.admin-datakey-form").on("ajax:success", (e, data, status, xhr) ->
      $("form.admin-datakey-form select").addClass('success-change')
    ).on "ajax:error", (e, xhr, status, error) ->
      $("form.admin-datakey-form select").addClass('fail-change').append("<p>ERROR</p>")


    $("select#app_control_report_key_id").change (evt) ->
      $(evt.target).removeClass('success-change')
      $(evt.target).closest('form').submit()

    $("select#app_control_report_key_id").change (evt) ->
      $(evt.target).removeClass('success-change')
      $(evt.target).closest('form').submit()


    $('.btn-group#mode_button_group .btn input[checked]').closest('.btn').addClass('active')