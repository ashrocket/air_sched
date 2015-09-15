#= require active_admin/base
#= require admin/abb_configs


#= require jquery/dist/jquery
#= require jquery-ui/jquery-ui
#= require jquery-ui/ui/core
#= require jquery-ui/ui/progressbar
#= require jquery-ui/ui/widget
#= require js-routes
#= require bootstrap
#= require jasny-bootstrap/dist/js/jasny-bootstrap
#= require bootstrap-datepicker/dist/js/bootstrap-datepicker

#= require datatables/media/js/jquery.dataTables
#= require datatables-tabletools/js/dataTables.tableTools
#= require datatables-plugins/pagination/jPaginator/dataTables.jPaginator
#= require datatables-plugins/integration/bootstrap/3/dataTables.bootstrap

#= require jquery/jquery.dataTables.fileSize

#= require hogan/web/1.0.0/hogan
#= require lodash/lodash.min
#= require underscore.string/dist/underscore.string.min
#= require typeahead.js/dist/typeahead
#= require jquery-file-upload/js/jquery.fileupload
#= require dates

#= require bootstrap-toggle/js/bootstrap-toggle

#= require bootstrap_init
#= require highlightjs/highlight.pack.js



# app/assets/javascripts/array-input.coffee
#$ ->
#  removeFromArrayInput = (el) ->
#    input = $(el).siblings('input')
#    if input.attr('disabled') == 'disabled'
#      $(el)
#        .html('<i class="fa fa-times-circle"></i>')
#        .removeClass('can-undo')
#      $(input).removeAttr('disabled')
#      $(input).removeClass('text--strike')
#    else
#      $(el)
#        .html('<i class="fa fa-undo"></i>')
#        .addClass('can-undo')
#      $(input).attr('disabled', 'disabled')
#      $(input).addClass('text--strike')
#
#  $('.js-add-to-array-input').click (e) ->
#    e.preventDefault
#
#    if $(@).hasClass('array-action--add')
#      original = $(@).parent()
#      clone    = $(original).clone(true)
#      clone_id = "clone_#{Math.floor((Math.random() * 100000) + 1)}"
#      input    = $(clone).find('input')
#
#      if $(input).val() != ''
#        # Remove error classes from original's input
#        $(original)
#          .find('input')
#          .removeClass('has-error')
#
#        # Reset clone's input
#        $(input)
#          .removeClass('has-error')
#          .attr('id', clone_id)
#          .val('')
#
#        # Change action to remove
#        $(@)
#          .html('<i class="fa fa-times-circle"></i>')
#          .attr('class', 'array-action--remove js-remove-from-array-input')
#
#        # Add clone and focus its input
#        $(@).parent().parent().append $(clone)
#        $("##{clone_id}").focus()
#
#      else
#        $(original)
#          .find('input')
#          .addClass('has-error')
#          .focus()
#
#    else
#      removeFromArrayInput $(@)
#
#  $('.js-remove-from-array-input').click (e) ->
#    e.preventDefault
#    removeFromArrayInput $(@)
hljs.initHighlightingOnLoad();
