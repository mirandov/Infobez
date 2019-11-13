loader_f = ->

  $inputGroup = $('.datepicker').parent('.input-group')

  if !$inputGroup.hasClass 'date'
    $inputGroup.addClass 'date'

  $inputGroup.datepicker
    format: 'dd.mm.yyyy'
    weekStart: 1
    language: 'ru'
    autoclose: true
    todayHighlight: true
app_ready_f = ->
  loader_f()
$(document).ready app_ready_f
$(document).on 'page:load', app_ready_f
$(document).on 'turbolinks:load', app_ready
